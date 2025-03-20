local wibox = require('wibox')
local beautiful = require('beautiful')

local M = {}

local HEIGHT = 20
local WIDTH = 40

local icons = {
  main = '★',
  post= '❃',
  telegram = '✈',
  slack = '☍',
  work_code = '☰',
  work_view = '☯',
  store = '🂠',
  other_1 = '⚀',
  other_2 = '⚁',
  other_3 = '⚂',
}

local function screen_widget_coordinates(screen)
  local presets = {
    [2] = {
      x = 20,
      y = screen.geometry.height - HEIGHT
    },
    [1] = {
      x = screen.geometry.width * 2 - WIDTH + 5,
      y = screen.geometry.height - HEIGHT
    }
  }

  return presets[screen.index]
end

local function current_tag_text(screen)
  local name = screen.selected_tag.name
  local icon = icons[name] or name

  return icon
end

local function build_widget(screen, x, y)
  local box =  wibox ({
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

function M.init(screen)
  local coordinates = screen_widget_coordinates(screen)

  if (coordinates) then
    build_widget(screen, coordinates.x, coordinates.y)
  end
end

return M
