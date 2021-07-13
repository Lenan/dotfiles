#!/bin/sh

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

  # outputs=$(xrandr --query | grep " connected" | cut -d " " -f1)
  output=$(bspc query -M --names)
  tray_output="DP-4"

  for m in $(bspc query -M --names); do
    if [[ $m == "DP-4" ]]; then
        tray_output=$m
    fi

    index=$((index +1))
    export P_BSPWM_WINDOW_CMD="tail ${HOME}/.cache/bspwm_windows_${index}"
    export MONITOR=$m

    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      TRAY_POSITION=right
    fi

    polybar --reload main & 
  done
