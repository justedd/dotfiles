local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local obj = {}

local height = 20
local width = 50

function obj.init(screen)
  local box = wibox ({
    x = 270,
    y = screen.geometry.height - height + 2,
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

  local textbox = wibox.widget.textbox('...')
  textbox.font = 'FiraCode Nerd Font 13'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(textbox)
  box:set_widget(layout)

  local command = "pacmd list-sinks | grep alsa_output.pci-0000_00 -A 15 | grep volume:\\ front-left |  awk '{ print $5 }' | tail -1"

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

return obj
