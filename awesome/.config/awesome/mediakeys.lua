local awful = require('awful')
local gears = require('gears')

local music_player = 'YandexMusic'

return gears.table.join(
    awful.key(
        { 'Shift', 'Control', 'Mod1', 'Mod4' }, "p",
        function()
            awful.util.spawn("flameshot gui")
        end
    ),

    awful.key(
        {}, 'XF86AudioPlay',
        function()
            awful.util.spawn('playerctl -p ' .. music_player .. ' play-pause')
        end
    ),

    awful.key(
        {}, 'XF86AudioPause',
        function()
            awful.util.spawn('playerctl -p ' .. music_player .. ' play-pause')
        end
    ),

    awful.key(
        {}, 'XF86AudioNext',
        function()
            awful.util.spawn('playerctl -p ' .. music_player .. ' next')
        end
    ),

    awful.key(
        {}, 'XF86AudioPrev',
        function()
            awful.util.spawn('playerctl -p ' .. music_player .. ' previous')
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
