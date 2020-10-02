#!/usr/bin/bash

source ~/.cache/wal/colors.sh

function run {
	if pgrep -f $1;
	then
		pkill $1
		while pgrep -u $UID -x $1 >/dev/null; do sleep 1; done
	fi
	$@&
}

function run_redshift {
	while pgrep -u $UID -x redshift >/dev/null;
	do
		redshift -x
		pkill $1
		pkill redshift
	done
	$@&
}

run ~/.config/polybar/launch.sh
run dunst &
#run autotiling
run /usr/lib/polkit-kde-authentication-agent-1 
run picom --experimental-backends &
run numlockx on &
sleep 2
#run nm-applet
run variety
run keepassxc 
run syncthingtray
run_redshift redshift-qt -l 41.722058311352065:2.9302747751915774 -t 6500:3000
