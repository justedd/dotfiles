local awful = require('awful')
local gears = require('gears')
local naughty = require("naughty")

function debug_msg(msg)
  naughty.notify({ title = msg, message = msg, timeout = 5 })
end

return gears.table.join(
  awful.key(
   { 'Control', 'Shift' }, 'Print',
   function()
      awful.util.spawn("sh -c 'maim -s | xclip -selection clipboard -t image/png'")
   end
 ),

  awful.key(
   { 'Shift' }, 'Print',
   function()
      awful.util.spawn("sh -c 'maim -s /home/justed/Pictures/Screenshots/$(date +\"%Y_%m_%d_%H_%M_%S\").png'")
   end
 ),

  awful.key(
    {}, 'XF86AudioPlay',
    function()
      awful.util.spawn('playerctl -p spotify play-pause')
    end),
 
  awful.key(
    {}, 'XF86AudioPause',
    function()
      awful.util.spawn('playerctl -p spotify play-pause')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioNext',
    function()
      awful.util.spawn('playerctl -p spotify next')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioPrev',
    function()
      awful.util.spawn('playerctl -p spotify previous')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioRaiseVolume',
    function()
      awful.util.spawn('pactl set-sink-volume @DEFAULT_SINK@ +5%')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioLowerVolume',
    function()
      awful.util.spawn('pactl set-sink-volume @DEFAULT_SINK@ -5%')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioMute',
    function()
      awful.util.spawn('pactl set-sink-mute @DEFAULT_SINK@ toggle')
    end
  )

  --awful.key(
    --{}, 's',
    --function()
      --debug_msg('kek')
    --end
  --)
)
