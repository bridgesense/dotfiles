local beautiful = require("beautiful")
local awful = require("awful")
local naughty = require("naughty")
local monitor = require("utils.monitor")
local wibox = require("wibox")
local merge = require("gears.table").merge
local new_for_path = require("lgi").Gio.File.new_for_path
local unpack = unpack or table.unpack -- luacheck: globals unpack (compatibility with Lua 5.1)

local battery_widget = {}

function battery_widget._show_battery_warning(time)
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Battery is low!",
    text = string.format("About %smin left based on your usage.", time) })
end

function battery_widget._parse(content)
  local battery_info = {}
  for status, power , energy, charge_str in content:gmatch('.*POWER_SUPPLY_STATUS=(%a+).+\
POWER_SUPPLY_POWER_NOW=(%d+).+POWER_SUPPLY_ENERGY_NOW=(%d+).+POWER_SUPPLY_CAPACITY=(%d+)') do
    table.insert(battery_info, {status = status, charge = charge_str, power = power, energy = energy})
  end
  local charge = 0
  local time   = 0
  local status = "Unknown"
  for _, batt in pairs(battery_info) do
    if batt.status == 'Charging' then
      status = batt.status
    elseif batt.status == 'Discharging' then
    time = time + batt.energy / batt.power
    end

    charge = charge + batt.charge
  end
  charge = charge / #battery_info
  time   = 60 * time -- minutes

  return charge, status, time
end

function battery_widget._get_batteries()
  local dir, batteries = new_for_path("/sys/class/power_supply/"), {}
  local files = dir:enumerate_children('standard::name', 'NONE')

  local file = files:next_file()
  while file do
    if file:get_name():match("BAT%d+") then
      table.insert(batteries, string.format("%s/%s/uevent", dir:get_path(), file:get_name()))
    end
    file = files:next_file()
  end

  return batteries
end

function battery_widget.init(args)
  args = args or {}
  args.path_to_icons = args.path_to_icons or awful.util.getdir("config") .. "themes/gruvbox/widgets/battery/"
  args.disable_battery_warning = args.disable_battery_warning or false
  args.timeout = args.timeout or 15

  battery_widget.image = wibox.widget {
    image = args.path_to_icons .. "battery-empty-symbolic.svg",
    widget = wibox.widget.imagebox,
  }
  battery_widget.text = wibox.widget.textbox()
  battery_widget.text:set_markup(string.format("<span color=%q><b>%s%%</b></span>", beautiful.bg_normal, 0))

  local last_battery_check = os.time()
  local batteryType = "battery-good-symbolic"

  monitor(unpack(merge(battery_widget._get_batteries(), {function(content)
    local charge, status, time = battery_widget._parse(content)

    battery_widget.text:set_markup(string.format("<span color=%q><b>%s%%</b></span>",
      beautiful.bg_normal, math.floor(charge)))

    if (charge >= 0 and charge < 15) then
      batteryType = "battery-empty%s-symbolic"
      if not args.disable_battery_warning and status ~= 'Charging'
        and os.difftime(os.time(), last_battery_check) > 300 then
          -- if 5 minutes have elapsed since the last warning
          last_battery_check = os.time()

          battery_widget._show_battery_warning(math.floor(time))
        end
    elseif (charge >= 15 and charge < 40) then batteryType = "battery-caution%s-symbolic"
    elseif (charge >= 40 and charge < 60) then batteryType = "battery-low%s-symbolic"
    elseif (charge >= 60 and charge < 80) then batteryType = "battery-good%s-symbolic"
    elseif (charge >= 80 and charge <= 100) then batteryType = "battery-full%s-symbolic"
    end

    if status == 'Charging' then
      batteryType = string.format(batteryType, '-charging')
    else
      batteryType = string.format(batteryType, '')
    end

    battery_widget.image:set_image(args.path_to_icons .. batteryType .. ".svg")

  end, args.timeout})))
end

return battery_widget