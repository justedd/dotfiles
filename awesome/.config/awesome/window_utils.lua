local awful = require('awful')
local gears = require("gears")

local naughty = require("naughty")

local obj = {}

function debug_msg(msg)
  naughty.notify({ title = msg, message = msg, timeout = 5 })
end

-- TODO remember previously focused client

function obj.focus(screen, mouselocation_x, mouselocation_y)
  gears.timer {
    timeout   = 0.05,
    call_now  = false,
    autostart = true,
    single_shot = true,
    callback  = function()
      awful.screen.focus(screen)

      local first_client = screen.clients[1]

      if first_client then
        client.focus = first_client
        first_client:raise()
      end

      mouse.coords {
        x = mouselocation_x,
        y = mouselocation_y
      }
    end
}
end

function obj.get_active()
  return awful.screen.focused()
end

function obj.unminimize(scr)
  --for j = 1, scr.clients.count() do
    --scr.cleints[j].minimized = false
  --end
end

function obj.previous_workspace(keep_focus)
  keep_focus = keep_focus or false

  if keep_focus then
    local mouselocation_x = mouse.coords().x
    local mouselocation_y = mouse.coords().y
  end

  local active_screen = obj.get_active()

  for i = 1, screen.count() do
    awful.tag.viewprev(screen[i])
    obj.unminimize(screen[i])
  end

  if keep_focus then
    obj.focus(active_screen, mouselocation_x, mouselocation_y)
  end
end

function obj.next_workspace(keep_focus)
  keep_focus = keep_focus or false

  local mouselocation_x
  local mouselocation_y

  if keep_focus then
    mouselocation_x = mouse.coords().x
    mouselocation_y = mouse.coords().y
  end

  local active_screen = obj.get_active()

  for i = 1, screen.count() do
    awful.tag.viewnext(screen[i])
    obj.unminimize(screen[i])
  end

  if keep_focus then
    obj.focus(active_screen, mouselocation_x, mouselocation_y)
  else
    --awful.screen.focus(active_screen)

    -- TODO focus screen by mouse position
    gears.timer({
      timeout   = 0.05,
      call_now  = false,
      autostart = true,
      single_shot = true,
      callback  = function()
        local first_client = active_screen.clients[1]

        if first_client then
          client.focus = first_client
          first_client:raise()
        end
      end
    })
  end
end

function obj.next_workspace_with_focus()
  obj.next_workspace(true)
end

function obj.previous_workspace_with_focus()
  obj.previous_workspace(true)
end

function obj.jump_to_tag(tag_name)
  local mouselocation_x = mouse.coords().x
  local mouselocation_y = mouse.coords().y
  local focused_screen = awful.screen.focused()

  for screen_index = 1, screen.count() do
    local screen = screen[screen_index]

    local tag = screen.tags[tag_name]

    if tag then
      tag:view_only()
    end
  end

  local first_client = focused_screen.clients[1]

  -- code tag
  if tag_name == 5 then
    if first_client == nil then
      awful.spawn.with_shell('kitty')
    end
  end

  if first_client then
    client.focus = first_client
    first_client:raise()
  end

  mouse.coords {
    x = mouselocation_x,
    y = mouselocation_y
  }
end

return obj
