local awful = require('awful')

local naughty = require("naughty")

local obj = {}

-- TODO remember previously focused client

function obj.focus(screen, mouselocation_x, mouselocation_y)
  awful.screen.focus(screen)

  local client = screen.clients[1]

  if client then
    client.focus = client
    client:raise()
  end

  mouse.coords {
    x = mouselocation_x,
    y = mouselocation_y
  }
end

function obj.get_active()
  return awful.screen.focused()
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
  end

  if keep_focus then
    obj.focus(active_screen, mouselocation_x, mouselocation_y)
  end
end

function obj.next_workspace_with_focus()
  obj.next_workspace(true)
end

function obj.previous_workspace_with_focus()
  obj.previous_workspace(true)
end

return obj
