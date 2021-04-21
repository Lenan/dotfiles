#!/bin/sh
#betterlockscreen -l blur &
loginctl lock-session
sleep 2
xset dpms force off
