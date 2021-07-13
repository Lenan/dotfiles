#!/usr/bin/env bash
name=$(bsp-layout get $(bspc query -D -m "$MONITOR" -d .active --names))
[[ "$name" == "tall" ]] && icon="ﴳ" || icon="ﴵ" 
echo "$icon"
