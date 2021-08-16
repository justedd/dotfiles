local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')

local obj = {}

local height = 20
local width = 40

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

function another_one(screen)
  if (screen.index == 2) then
    return
  end

  local box = wibox ({
    x = 30,
    y = 0,
    opacity = 0.60,
    width = width,
    height = height,
    input_passthrough = false,
    visible = true,
    screen = screen,
    bg = beautiful.bg_normal .. '00' ,
    type = 'normal',
  })

  box.x = screen.geometry.width * 2 - width + 5
  box.y = screen.geometry.height - height

  local textbox = wibox.widget.textbox(screen.selected_tag.name)
  textbox.font = 'FiraCode Nerd Font 13'
  local layout = wibox.layout.fixed.horizontal()
  layout:add(textbox)
  box:set_widget(textbox)

  screen:connect_signal(
    'tag::history::update',
    function(c)
      textbox.markup = current_tag_text(screen)
    end
  )
end

function obj.init(screen)
  local box = wibox ({
    x = 20,
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
