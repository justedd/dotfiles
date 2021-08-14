local awful = require('awful')
local gears = require('gears')

return gears.table.join(
 awful.key(
   {}, 'XF86AudioPlay',
   function()
     awful.util.spawn('playerctl play-pause')
   end),

 awful.key(
   {}, 'XF86AudioPause',
   function()
     awful.util.spawn('playerctl play-pause')
   end
 ),

 awful.key(
   {}, 'XF86AudioNext',
   function()
     awful.util.spawn('playerctl next')
   end
 ),

 awful.key(
   {}, 'XF86AudioPrev',
   function()
     awful.util.spawn('playerctl previous')
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
)
