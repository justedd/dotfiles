#!/bin/bash

current_profile=$(pacmd list-cards | grep 'active profile' | tail -1 | awk '{print $NF}')

if [ $current_profile == "<output:analog-stereo>" ]
then
  echo "analog"
elif [ $current_profile == "<output:iec958-stereo>" ]
then
  echo "digital"
fi
