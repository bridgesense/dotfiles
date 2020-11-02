local awful = require("awful")
local grect = require("gears.geometry").rectangle

local function taghelper(func)
  return function(_, _, count, movement)
    local screen, index = awful.screen.focused()
    count = count == '' and 1 or tonumber(count)

    if movement == 'g' then
      index = count
    elseif movement == 'f' then
      index = ((screen.selected_tag.index - 1 + count) % #screen.tags) + 1
    elseif movement == 'b' then
      index = ((screen.selected_tag.index - 1 - count) % #screen.tags) + 1
    end

    if screen.tags[index] then
      func(screen.tags[index])
    end
  end
end

local tag_commands = {
  {
    description = "focus client by direction",
    pattern = {'%d*', '[hjkl]'},
    handler = function(_, count, movement)
      local directions = {h = 'left', j = 'down', k = 'up', l = 'right'}
      count = count == '' and 1 or tonumber(count)

      for _ = 1, count do
        awful.client.focus.bydirection(directions[movement])
      end
    end
  },
  {
    description = "focus tag by direction or globally",
    pattern = {'%d*', '[gfb]'},
    handler = function(_, count, movement)
      count = count == '' and 1 or tonumber(count)

      if movement == 'g' then
        local screen = awful.screen.focused()
        local tag = screen.tags[count]
        if tag then
          tag:view_only()
        end
      elseif movement == 'f' then
        awful.tag.viewidx(count)
      elseif movement == 'b' then
        awful.tag.viewidx(-count)
      end
    end
  },
  {
    description = "focus next/previous screen",
    pattern = {'%d*', '[eq]'},
    handler = function(_, count, movement)
      count = count == '' and 1 or tonumber(count)

      if movement == 'e' then
        awful.screen.focus_relative(count)
      elseif movement == 'q' then
        awful.screen.focus_relative(-count)
      end
    end
  },
  {
    description = "swap client by direction",
    pattern = {'%d*', '[HJKL]'},
    handler = function(_, count, movement)
      local directions = {H = 'left', J = 'down', K = 'up', L = 'right'}
      local sel        = client.focus
      local scr        = sel.screen
      count = count == '' and 1 or tonumber(count)

      -- this is a bit hacky, but awful.client.swap.bydirection doesn't work as expected
      if sel then
        local clients    = scr.clients
        local geometries = {}
        for i,cl in ipairs(clients) do
          geometries[i] = cl:geometry()
        end

        local current = sel
        for _ = 1, count do
          local target = grect.get_in_direction(directions[movement], geometries, current:geometry())

          -- If we found a client to swap with, then go for it
          if target then
            current = clients[target]
            current:swap(sel)
          else
            break
          end
        end
      end
    end
  },
  {
    description = "jump to urgent client",
    pattern = {'x'},
    handler = function() awful.client.urgent.jumpto() end
  },
  {
    description = "toggle tag",
    pattern = {'t', '%d*', '[gfb]'},
    handler = taghelper(awful.tag.viewtoggle)
  },
  {
    description = "move focused client to tag",
    pattern = {'m', '%d*', '[gfb]'},
    handler = taghelper(function(arg)
      local c = client.focus
      if c then
        c:move_to_tag(arg)
      end
    end)
  },
  {
    description = "toggle focused client on tag",
    pattern = {'d', '%d*', '[gfb]'},
    handler = taghelper(function(arg)
      local c = client.focus
      if c then
        c:toggle_tag(arg)
      end
    end)
  },
  {
    description = "move to master",
    pattern = {'y'},
    handler = function()
      local c, m = client.focus, awful.client.getmaster()
      if c and m then
        c:swap(m)
      end
    end
  },
  {
    description = "move to next/previous screen",
    pattern = {'m', '%d*', '[eq]'},
    handler = function(_, _, count, movement)
      local c = client.focus
      count = count == '' and 1 or tonumber(count)

      if c then
        if movement == 'e' then
          c:move_to_screen(c.screen.index + count)
        else
          c:move_to_screen(c.screen.index - count)
        end
      end
    end
  },
  {
    description = "close client",
    pattern = {'C'},
    handler = function()
      local c = client.focus
      if c then
        c:kill()
      end
    end
  },
  {
    description = "toggle floating",
    pattern = {'V'},
    handler = function()
      local c = client.focus
      if c then
        c.floating = not c.floating
      end
    end
  },
  {
    description = "toggle keep on top",
    pattern = {'O'},
    handler = function()
      local c = client.focus
      if c then
        c.ontop = not c.ontop
      end
    end
  },
  {
    description = "toggle sticky",
    pattern = {'S'},
    handler = function()
      local c = client.focus
      if c then
        c.sticky = not c.sticky
      end
    end
  },
  {
    description = "toggle fullscreen",
    pattern = {'F'},
    handler = function()
      local c = client.focus
      if c then
        c.fullscreen = not c.fullscreen
        c:raise()
      end
    end
  },
  {
    description = "toggle maximized",
    pattern = {'M'},
    handler = function()
      local c = client.focus
      if c then
        c.maximized = not c.maximized
        c:raise()
      end
    end
  },
  {
    description = "minimize",
    pattern = {'n'},
    handler = function()
      local c = client.focus
      if c then
        c.minimized = true
      end
    end
  },
  {
    description = "restore minimized",
    pattern = {'u'},
    handler = function()
        local c = awful.client.restore()
        if c then
            client.focus = c
            c:raise()
        end
    end,
  },
  {
    description = "go back in tag history",
    pattern = {'z'},
    handler = function()
      awful.tag.history.restore()
    end
  },
  {
    description = "go back in client history",
    pattern = {'Z'},
    handler = function()
      awful.client.focus.history.previous()
      if client.focus then
          client.focus:raise()
      end
    end
  },
  {
    description = "enter client mode",
    pattern = {'i'},
    handler = function(mode) mode.stop() end
  },
  {
    description = "enter launcher mode",
    pattern = {'r'},
    handler = function(mode) mode.start("launcher") end
  },
  {
    description = "enter layout mode",
    pattern = {'w'},
    handler = function(mode) mode.start("layout") end
  },
}

return tag_commands
