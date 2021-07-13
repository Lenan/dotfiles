#!/usr/bin/env bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi   
}

# mouse gets set to second monitor by default for some reason...
# use this to move mouse to center of first monitor
xdotool mousemove 1280 720

# autostart programs
run unclutter --root
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run picom --experimental-backends &
run numlockx on &
run xss-lock -- betterlockscreen -l blur &
dunst &

sleep 1
run redshift -l 41.722058311352065:2.9302747751915774 -t 6500:3000 &

