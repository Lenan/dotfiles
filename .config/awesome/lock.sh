#!/bin/sh
# xss -- betterlockscreen -l blur &
loginctl lock-session ${XDG_SESSION_ID-}
sleep 2
xset dpms force off
