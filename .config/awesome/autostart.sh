#!/usr/bin/env bash

source /home/lenan/.cache/wal/colors.sh

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi   
}
run unclutter --root
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
#run /usr/lib/polkit-kde-authentication-agent-1
#start-pulseaudio-x11
#run qjackctl
run cadence-session-start --system-start
run nvidia-settings --load-config-only
run picom --experimental-backends &
run numlockx on &
# run caffeine-ng
sleep 2
run keepassxc
run variety
run syncthingtray
run redshift-qt -l 41.722058311352065:2.9302747751915774 -t 6500:3000

#set capslock as esc
setxkbmap -option caps:escape 
