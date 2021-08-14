local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local obj = {}

local height = 20
local width = 40

local icons = {
  main = '★',
  post= '🖃',
  telegram = '☎',
  slack = '☍',
  work_code = '☰',
  work_view = '☯',
  other_1 = '1',
  other_2 = '2',
  other_2 = '3',
}

local function current_tag_text(screen)
  local name = icons[screen.selected_tag.name]

  return '<span foreground="#333333">' .. name .. '</span>'
end

function obj.init(screen)
  local box = wibox ({
    x = screen.geometry.width - width,
    y = screen.geometry.height - height,
    --opacity = 0.10,
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

  local textbox = wibox.widget.textbox(screen.selected_tag.name)
  textbox.font = 'FiraCode Nerd Font 13'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(textbox)
  --layout.third = textbox
  box:set_widget(layout)

  screen:connect_signal(
    'tag::history::update',
    function(c)
      textbox.markup = current_tag_text(screen)
    end
  )
end

return obj
