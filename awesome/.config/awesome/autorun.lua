local awful = require("awful")

--local autorun = {}

--function autorun.init(awful)
awful.spawn.with_shell('sleep 0.3 && nitrogen --restore')
awful.spawn.with_shell('compton')
awful.spawn.with_shell("setxkbmap -option 'grp:win_space_toggle' -layout us,ru")

-- Disable screen turning off
awful.spawn.with_shell('xset s off')
awful.spawn.with_shell('xset -dpms')
awful.spawn.with_shell('xset s noblank')
--end

--return autorun
