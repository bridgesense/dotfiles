local awful     = require("awful")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local monitor   = require("utils.monitor")

local net_widget = {}
net_widget.wired = "OFF"

local function read_wireless(content, interface)
  local match = content:match(interface .. ": " .. "%d+   (%d+)")

  if match then
    local signal_strength = math.floor(match / 70 * 100)
    local index           = math.floor(math.min(4, signal_strength / 20))
    return {signal_strength .. "%", "wireless_" .. index .. ".svg"}
  else
    return {"OFF", "wireless_na.svg"}
  end
end

local function read_wired(content)
  local match = content:match("up\n$")

  if match then
    net_widget.wired = "ON"
    return {"100%", "wired.svg"}
  else
    net_widget.wired = "OFF"
    return {"OFF", "wired_na.svg"}
  end
end

function net_widget.init(args)
  args = args or {}

  args.wireless_interface = args.wireless_interface or "wlp0s20f3"
  args.wired_interface    = args.wired_interface or "enp0s20f0u2u1"
  args.path_to_icons      = args.path_to_icons or awful.util.getdir("config") .. "themes/gruvbox/widgets/net/"
  args.timeout            = args.timeout or 15

  net_widget.image = wibox.widget {
    image  = args.path_to_icons .. "wired_na.svg",
    widget = wibox.widget.imagebox,
  }
  net_widget.text = wibox.widget.textbox()
  net_widget.text:set_markup(string.format("<span color=%q><b>%s</b></span>", beautiful.bg_normal, "OFF"))

  monitor("/sys/class/net/" .. args.wired_interface .. "/operstate", function(content)
    local result = read_wired(content)

    if net_widget.wired == "ON" then
        net_widget.text:set_markup(string.format("<span color=%q><b>%s</b></span>", beautiful.bg_normal, result[1]))
        net_widget.image:set_image(args.path_to_icons .. result[2])
    end
  end, args.timeout)

  monitor("/proc/net/wireless", function(content)
    local result = read_wireless(content, args.wireless_interface)

    if net_widget.wired == "OFF" then
        net_widget.text:set_markup(string.format("<span color=%q><b>%s</b></span>", beautiful.bg_normal, result[1]))
        net_widget.image:set_image(args.path_to_icons .. result[2])
    end
  end, args.timeout)

end

return net_widget
