#!/bin/bash


set -Eeo pipefail

workingDir="$(pwd)"
waybarDir=~/".config/waybar/"
wofiDir=~/".config/wofi/"
wpDir=~/"Pictures/Wallpapers/"
paperDir=~/".config/hypr/hyperpaper.conf"

echo "Checking for waybar config dir..."

if [ -d ${waybarDir} ]; then
	echo "Packing up existing Waybar config..."
	sleep 1
	mkdir -p "${waybarDir}old/"
	cp "${waybarDir}config" "${waybarDir}style.css" "${waybarDir}old/"
	echo "Sending over new config..."
	sleep 1
	cp "${workingDir}/waybar/"* "${waybarDir}"
	echo "Waybar configured (◡‿◡✿) ..."
else
	echo "Waybar config not found..."
	sleep 1
	echo "Creating Waybar directory..."
	mkdir "${waybarDir}"
	sleep 1
	echo "Sending over config..."
	sleep 1
	cp "${workingDir}/waybar/"* "${workingDir}"
	echo "Waybar configured (◡‿◡✿) ..."
fi

if [ -d ${wofiDir} ]; then
	echo "Packing up existing Wofi config..."
	sleep 1
	mkdir -p "${wofiDir}old/"
	mv "${wofiDir}config" "${wofiDir}style.css" "${wofiDir}old/"
	echo "Sending over new config..."
	sleep 1
	cp "${workingDir}/wofi/"* "${wofiDir}"
	echo "Wofi configured (◡‿◡✿) ..."
else
	echo "Wofi config not found..."
	sleep 1
	echo "Creating Wofi directory..."
	mkdir -p "${wofiDir}"
	sleep 1
	echo "Sending over config..."
	sleep 1
	cp "${workingDir}/wofi"* "${wofiDir}"
	echo "Wofi configured (◡‿◡✿) ..."
fi


if [ ${paperDir} ]; then
	echo "Checking dirs..."
	if [ -d ${wpDir} ]; then
		echo "Placing wallpaper in ${wpDir}..."
		cp "${workingDir}/wallpaper/"* "${wpDir}"
		sleep 1
		echo "Updating hyprpaper config..."
		echo "preload = ${wpDir}4a5759.png" > ${paperDir}
		echo "wallpaper =, ${wpDir}4a5759.png" > ${paperDir}
		"hyprpaper configred (◡‿◡✿) ..."
	else
		echo "Placing wallpaper in ~/Pictures..."
		cp "${workingDir}/wallpaper/"* ~/"Pictures"
		sleep 1
		echo "Updating hyprpaper config..."
		echo "preload = ~/Pictures/4a5759.png" > ${paperDir}
		echo "wallpaper =, ~/Pictures/4a5759.png" > ${paperDir}
		"hyprpaper configred (◡‿◡✿) ..."
	fi
else
	echo "Checking dirs..."
	if [ -d ${wpDir} ]; then
		echo "Placing wallpaper in ${wpDir}..."
		cp "${workingDir}/wallpaper/"* "${wpDir}"
		sleep 1
		echo "Creating hyprpaper config..."
		echo "preload = ${wpDir}4a5759.png" > ${paperDir}
		echo "wallpaper =, ${wpDir}4a5759.png" > ${paperDir}
		"hyprpaper configred (◡‿◡✿) ..."
	else
		echo "Placing wallpaper in ~/Pictures..."
		cp "${workingDir}wallpaper/"* ~/"Pictures"
		sleep 1
		echo "Creating hyprpaper config..."
		echo "preload = ~/Pictures/4a5759.png" > ${paperDir}
		echo "wallpaper =, ~/Pictures/4a5759.png" > ${paperDir}
		"hyprpaper configred (◡‿◡✿) ..."
	fi
	sleep 1
	"hyprpaper configred (◡‿◡✿) ..."
fi
