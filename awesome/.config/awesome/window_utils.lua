local awful = require('awful')

local obj = {}

function obj.previous_workspace()
  for i = 1, screen.count() do
    awful.tag.viewprev(screen[i])
  end
end

function obj.next_workspace()
  for i = 1, screen.count() do
    awful.tag.viewnext(screen[i])
  end
end

return obj
