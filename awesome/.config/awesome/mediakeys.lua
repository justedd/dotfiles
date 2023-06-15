local awful = require('awful')
local gears = require('gears')
local naughty = require("naughty")

local music_player = 'YandexMusic'

function debug_msg(msg)
  naughty.notify({ title = msg, message = msg, timeout = 5 })
end

function exec_in_shell(cmd)
  awful.spawn.easy_async_with_shell(cmd, function(out)
    -- noop
  end)
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
  { 'Shift', 'Control', 'Mod1', 'Mod4' }, "p",
   function()
      awful.util.spawn("flameshot gui")
   end
   ),

  awful.key(
    {}, 'XF86AudioPlay',
    function()
      awful.util.spawn('playerctl -p ' .. music_player ..' play-pause')
    end),
 
  awful.key(
    {}, 'XF86AudioPause',
    function()
      awful.util.spawn('playerctl -p ' .. music_player ..' play-pause')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioNext',
    function()
      awful.util.spawn('playerctl -p ' .. music_player ..' next')
    end
  ),
 
  awful.key(
    {}, 'XF86AudioPrev',
    function()
      awful.util.spawn('playerctl -p ' .. music_player ..' previous')
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
  ),

  awful.key(
    { 'Shift', 'Control', 'Mod1', 'Mod4' }, "w",
    function()
      exec_in_shell("~/core/scripts/smplayer/backward.sh")
    end
  ),

  awful.key(
    { 'Shift', 'Control', 'Mod1', 'Mod4' }, "r",
    function()
      exec_in_shell("~/core/scripts/smplayer/forward.sh")
    end
  ),

  awful.key(
    { 'Shift', 'Control', 'Mod1', 'Mod4' }, "e",
    function()
      exec_in_shell("~/core/scripts/smplayer/capture.sh")
    end
  )
)
