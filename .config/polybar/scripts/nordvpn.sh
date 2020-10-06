#!/bin/sh

output=$(nordvpn status | grep -i status | awk '{print $4}')
toggle(){
	if [ "$output" = 'Connected' ];
	then
		nordvpn disconnect
	else
		nordvpn connect es
	fi
}

status() {
	if [ "$output" = 'Connected' ]
	then
		echo ""
	else
		echo "輦"
	fi
}

case "$1" in
	--toggle)
		toggle
		;;
	*)
		status
		;;
esac
