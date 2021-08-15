local awful = require('awful')

local obj = {}

-- TODO remember previously focused client

function focus(screen, client)
  awful.screen.focus(screen)

  local client = screen.clients[1]

  if client then
    client.focus = client
    client:raise()
  end
end

function get_active()
  return awful.screen.focused()
end

function obj.previous_workspace(keep_focus)
  keep_focus = keep_focus or false

  local active_screen = get_active()

  for i = 1, screen.count() do
    awful.tag.viewprev(screen[i])
  end

  if keep_focus then
    focus(active_screen)
  end
end

function obj.next_workspace(keep_focus)
  keep_focus = keep_focus or false

  local active_screen = get_active()

  for i = 1, screen.count() do
    awful.tag.viewnext(screen[i])
  end

  if keep_focus then
    focus(active_screen)
  end
end

function obj.next_workspace_with_focus()
  obj.next_workspace(true)
end

function obj.previous_workspace_with_focus()
  obj.previous_workspace(true)
end

return obj
