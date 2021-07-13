#!/bin/sh
connected_icon="聯"
disconnected_icon="輦"
status=$(nordvpn status | awk '{print $4}')

echoState() {
	if [[ "$status" == "Disconnected" ]]; then
		echo "$disconnected_icon"
	else
		echo "$connected_icon"
	fi
}

toggleState(){
	if [[ "$status" == "Connected" ]]; then
		nordvpn disconnect
	else
		nordvpn connect
	fi

	echoState
}

case "$1" in
	--toggle)
        toggleState
		;;
	*)
		echoState
		;;
esac
