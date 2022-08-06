local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local obj = {}

local height = 20
local width = 200

function get_icon(text)
  local icons = {
    analog = "🔊",
    digital = "🎧",
  }

  text = string.gsub(text, "%s+", "")
  return icons[text] or text
end

function obj.init(screen)
  local box = wibox ({
    x = 240,
    y = screen.geometry.height - height,
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

  local command = "/home/justed/core/scripts/current_sound.sh"

  gears.timer {
    timeout   = 1,
    call_now  = true,
    autostart = true,
    callback  = function()
      awful.spawn.easy_async_with_shell(command, function(out)
        textbox.markup = get_icon(out)
      end)
    end
  }

  box:buttons(
    awful.util.table.join(
      awful.button(
        {}, 1, function()
          local command = "/home/justed/core/scripts/toggle_card.sh"
          awful.spawn.easy_async_with_shell(command, function(out)
          end)
        end
      )
    )
  )
end

return obj
