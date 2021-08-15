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
  work_view = '☯'
}

local function current_tag_text(screen)
  local name = screen.selected_tag.name
  local icon = icons[name] or name

  return icon
end

function obj.init(screen)
  local box = wibox ({
    x = 200,
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
