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
  )
)
