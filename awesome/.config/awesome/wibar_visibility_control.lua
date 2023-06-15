local gears = require("gears")
local wibox = require("wibox")

local M = {}

function M.init(screen, wibar)
  wibar.visible = false

  local detect = gears.timer({
    timeout = 0.35,
    callback = function ()
      if (mouse.screen ~= screen) or
        (mouse.coords().y > 30)
        then
          wibar.visible = false
          detect:stop()
        end
    end
  })

  local enable_wibar = function ()
    wibar.visible = true
    if not detect.started then
      detect:start()
    end
  end

  local activation_zone = wibox ({
    x = screen.geometry.x,
    y = 0,
    opacity = 0.0,
    width = screen.geometry.width,
    height = 5,
    screen = screen,
    input_passthrough = false,
    visible = true,
    ontop = true,
    type = "dock",
  })

  activation_zone:connect_signal("mouse::enter", function ()
    enable_wibar()
  end)
end

return M
