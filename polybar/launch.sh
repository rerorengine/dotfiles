#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	pkill polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    polybar -q main -c "$dir/$style.ini" &
}

if [[ "$1" == "--comfy" ]]; then
	style="comfy"
	launch_bar

elif [[ "$1" == "--info" ]]; then
	style="informative"
	launch_bar

elif [[ "$1" == "--compact" ]]; then
	style="compact"
	launch_bar

elif [[ "$1" == "--manas" ]]; then
    style="config"
    launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme

	Available Themes :
	--comfy    --compact       --info
	EOF
fi
