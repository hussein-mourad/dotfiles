#!/bin/bash
# weather.sh
# shell script to prepend i3status with weather

i3status | while :; do
	read -r line
	weather=$(cat ~/.weather.cache | cut -d " " -f 2-)
	# weather_json='"name":"weather","color":"#FFFFFF", "full_text":'
	# weather_json+=$(echo -n "$weather" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))')
	# weather_json+='},{'

	# Inject our JSON into $line after the first [{
	# line=${line/[{/[{$weather}
	echo "$weather   $line " || exit 1
done
