local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local obj = {}

local HEIGHT = 20
local WIDTH = 40

local icons = {
  main = '★',
  post= '❃',
  telegram = '✈',
  slack = '☍',
  work_code = '☰',
  work_view = '☯',
  other_1 = '⚀',
  other_2 = '⚁',
  other_3 = '⚂',
}

local function current_tag_text(screen)
  local name = screen.selected_tag.name
  local icon = icons[name] or name

  return icon
end

local function build_wibox(screen, x, y)
  return wibox ({
    x = x,
    y = y,
    opacity = 0.60,
    width = WIDTH,
    height = HEIGHT,
    input_passthrough = false,
    visible = true,
    screen = screen,
    bg = beautiful.bg_normal .. '00' ,
    type = 'normal',
  })
end

function another_one(screen)
  if (screen.index == 2) then
    return
  end

  local box = build_wibox(screen, 30, 0)

  box.x = screen.geometry.width * 2 - WIDTH + 5
  box.y = screen.geometry.height - HEIGHT

  local textbox = wibox.widget.textbox(screen.selected_tag.name)
  textbox.font = 'FiraCode Nerd Font 13'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(textbox)
  box:set_widget(textbox)

  screen:connect_signal(
    'tag::history::update',
    function()
      textbox.markup = current_tag_text(screen)
    end
  )
end

function obj.init(screen)
  local box = build_wibox(screen, 20, screen.geometry.height - HEIGHT)

  local textbox = wibox.widget.textbox(screen.selected_tag.name)
  textbox.font = 'FiraCode Nerd Font 13'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(textbox)
  box:set_widget(layout)

  screen:connect_signal(
    'tag::history::update',
    function(c)
      textbox.markup = current_tag_text(screen)
    end
  )

  another_one(screen);
end

return obj
