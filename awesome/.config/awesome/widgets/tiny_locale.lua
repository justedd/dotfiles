local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local M = {}

local height = 20
local width = 50

function M.init(screen)
  local box = wibox ({
    x = 320,
    y = screen.geometry.height - height + 1,
    opacity = 0.40,
    width = width,
    height = height,
    input_passthrough = false,
    visible = true,
    ontop = true,
    layout = awful.widget.only_on_screen,
    screen = 2,
    bg = beautiful.bg_normal .. '00' ,
    type = 'desktop',
  })

  local textbox = wibox.widget.textbox('...')
  textbox.font = 'FiraCode Nerd Font 13'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(textbox)
  box:set_widget(layout)

  local command = "xkb-switch -p"

  -- TODO: use events
  gears.timer {
    timeout   = 0.2,
    call_now  = true,
    autostart = true,
    callback  = function()
      awful.spawn.easy_async_with_shell(command, function(out)
        textbox.markup = out
      end)
    end
  }
end

return M
