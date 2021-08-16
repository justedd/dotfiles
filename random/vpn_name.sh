#!/bin/bash

vpn_active=$(nmcli c show --active | grep vpn | awk '{print $1}')

if [ -z "$vpn_active" ]
then
      echo "💢"
elif [ $vpn_active == "freshauto" ]
then
  echo "🚷 🚳 $vpn_active"
else
  echo "✔ $vpn_active"
fi
