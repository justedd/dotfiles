local gears = require('gears')
local awful = require('awful')
local window_utils = require('window_utils')

return gears.table.join(
    awful.button(
      {}, 3,
      function()
        if 1440 - mouse.coords().y > 100 then
          return
        end

        window_utils.previous_workspace(true)
      end
    ),
    awful.button(
      {}, 1,
      function()
        if 1440 - mouse.coords().y > 100 then
          return
        end

        window_utils.next_workspace(true)
      end
    ),
    awful.button(
      {}, 2,
      function()
        local height = 30
        local width = 500

        if (mouse.coords().x > 2560 * 2 - width) and (mouse.coords().y < height) then
          window_utils.jump_to_tag(1)
        end

        if (mouse.coords().x > 2560 * 2 - height) and (mouse.coords().y < width) then
          window_utils.jump_to_tag(5)
        end
      end
    )
)


