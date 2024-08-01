local awful = require("awful")

awful.spawn.with_shell('picom')
awful.spawn.with_shell("setxkbmap -option 'grp:win_space_toggle' -layout us,ru")
awful.spawn.with_shell('nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=1"')
awful.spawn.with_shell('/home/justed/core/scripts/clean_history.sh')
