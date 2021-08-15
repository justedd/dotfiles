local awful = require("awful")

awful.spawn.with_shell('picom')
awful.spawn.with_shell("setxkbmap -option 'grp:win_space_toggle' -layout us,ru")

awful.spawn.with_shell('xset s off')
awful.spawn.with_shell('xset -dpms')
awful.spawn.with_shell('xset s noblank')
awful.spawn.once('nmcli c up DO')
