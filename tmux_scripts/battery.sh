#!/bin/bash

# echo $(pmset -g batt | grep -o "[0-9]\+%")
# echo $(cat /sys/class/power_supply/BAT0/capacity)
cat /sys/class/power_supply/BAT0/capacity
