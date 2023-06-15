local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local M = {}

local height = 20
local width = 200

function M.init(screen)
  local box = wibox ({
    x = 50,
    y = screen.geometry.height - height,
    opacity = 0.40,
    width = width,
    height = height,
    input_passthrough = false,
    visible = true,
    ontop = true,
    layout = awful.widget.only_on_screen,
    screen = 1,
    bg = beautiful.bg_normal .. '00' ,
    type = 'desktop',
  })

  local clock = wibox.widget.textclock()
  clock.font = 'FiraCode Nerd Font 11'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(clock)
  box:set_widget(layout)
end

return M
