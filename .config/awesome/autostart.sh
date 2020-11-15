#!/usr/bin/env bash

source /home/lenan/.cache/wal/colors.sh

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi   
}
run /usr/lib/polkit-kde-authentication-agent-1
start-pulseaudio-x11
run nvidia-settings --load-config-only
run picom --experimental-backends &
run numlockx on &
sleep 2
run keepassxc
run variety
run syncthingtray
run redshift-qt -l 41.722058311352065:2.9302747751915774 -t 6500:3000
