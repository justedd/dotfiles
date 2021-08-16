#!/bin/bash

current_profile=$(pacmd list-cards | grep 'active profile' | tail -1 | awk '{print $NF}')

if [ $current_profile == "<output:analog-stereo>" ]
then
  pacmd set-card-profile 2 output:iec958-stereo
elif [ $current_profile == "<output:iec958-stereo>" ]
then
  pacmd set-card-profile 2 output:analog-stereo
fi

sync=$(pacmd list-sinks | grep 'index' | tail -1 | awk '{print $NF}')

pacmd set-default-sink $sync
