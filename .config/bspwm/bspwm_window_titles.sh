#!/usr/bin/env bash

# while pgrep -u $UID -f ~/.config/bspwm/bspwm_window_titles.sh >/dev/null; do pkill -f ~/.config/bspwm/bspwm_window_titles.sh; done

cache_path="${HOME}/.cache"

icon_map=$( cat "$( dirname "$( readlink -f "$0" )" )/bspwm_window_titles_icon_map" )
active_color=$( xrdb -query | grep color4: | cut -d ":" -f 2 | tr -d [:blank:] )

# subscribe to events on which the window title list will get updated
bspc subscribe node_focus node_activate node_add node_swap node_remove desktop_focus desktop_activate | while read -r _; do

    # get all monitors
    monitors=$( bspc query -M )

    for monitor in $monitors; do

        # index
        index=$((index + 1))

        # get last focused desktop on given monitor
        last_focused_desktop=$( bspc query -D -m "$monitor" -d .active )

        # get windows from last focused desktop on given monitor
        winids_on_desktop=$( bspc query -N -n .window -m "$monitor" -d "$last_focused_desktop" )

        # get number of windows on desktop
        number_of_windows=$( printf "$winids_on_desktop" | tr '\n' ' ' | wc -w  )

        # get a list of all windows
        winlist=$( wmctrl -l -x )

        for window_id in $winids_on_desktop; do
            # replace all spaces and tabs with single spaces for easier cutting
            window=$( echo "$winlist" | grep -i "$window_id" | tr -s '[:blank:]' )
            # get window name
            window_name=$( echo "$window" | cut -d " " -f 5- )
            # longer window titles if there is only one window
            [[ "$number_of_windows" == "1" ]] && char_cut="40" || let char_cut=160/number_of_windows
            # cut the window name
            window_name_short=$( echo "$window_name" | cut -c1-"$char_cut" )

            # get window class and match after a dot to get app name
            window_class=$( echo "$window" | cut -d " " -f 3 | sed 's/.*\.//')
            window_class="${window_class^}"

            window_instance=$( echo "$window" | awk '{print $3}' | cut -d "." -f 1)
            window_instance="${window_instance^}"

            if [[ "$window_instance" == "Navigator" ]]; then
                window_instance="Firefox"
            fi

            # if window id matched with list == not empty
            if [[ -n "$window_name" ]]; then

                # trim window name
                window_name=$( echo "$window_name_short" | sed -e 's/^[[:space:]]*//' )
                if [[ "$window_name" == "N/A" ]]; then
                    window_name=$(echo "$window" | cut -d " " -f 3 | cut -d "." -f 2 )
                fi

                # get icon for class name
                window_icon=$( grep "$window_class" <<< "$icon_map" | cut -d " " -f2 )

                # fallback icon if class not found
                if [[ -z "$window_icon" ]]; then
                    window_icon=$( grep "Fallback" <<< "$icon_map" | cut -d " " -f2 )
                fi

                # join icon and name
                # window_name_with_icon="${window_icon} ${window_name}"
                window_name_with_icon="${window_icon} ${window_instance}"

                # change text color of active window
                [[ "$window_id" == $( bspc query -N -n focused) ]] && curr_wins+="%{o${active_color}}%{+o} ${window_name_with_icon} %{-o}" || curr_wins+=" ${window_name_with_icon} "

            fi
        done

        # don't print names if there is only one
        # turned on with 'nomonocle'
        if [[ "$1" == "nomonocle" ]]; then
            [[ "$number_of_windows" == "1" ]] && windows_print="" || windows_print="$curr_wins"
        else
            windows_print="$curr_wins"
        fi

        # print out the window names to files for use in a bar
        echo "$windows_print" > "${cache_path}/bspwm_windows_${index}"
        unset curr_wins

    done

    unset index

done
