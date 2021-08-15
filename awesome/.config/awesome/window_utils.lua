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

function obj.previous_workspace()
  local active_screen = get_active()

  for i = 1, screen.count() do
    awful.tag.viewprev(screen[i])
  end

  focus(active_screen)
end

function obj.next_workspace()
  local active_screen = get_active()

  for i = 1, screen.count() do
    awful.tag.viewnext(screen[i])
  end

  focus(active_screen)
end

return obj
