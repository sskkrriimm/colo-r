#!/bin/bash


set -Eeo pipefail

workingDir="$(pwd)"
waybarDir=~/".config/waybar/"
wofiDir=~/".config/wofi/"

echo "Checking for waybar config dir..."

if [ -d ${waybarDir} ]; then
	echo "Packing up existing Waybar config..."
	sleep 1
	mkdir -p "${waybarDir}old/"
	mv "${waybarDir}config" "${waybarDir}style.css" "${waybarDir}old/"
	echo "Sending over new config..."
	sleep 1
	cp "${workingDir}/waybar/*" "${waybarDir}"
	echo "Waybar configured (◡‿◡✿) ..."
else
	echo "Waybar config not found..."
	sleep 1
	echo "Creating Waybar directory..."
	mkdir "${waybarDir}"
	sleep 1
	echo "Sending over config..."
	sleep 1
	cp "${workingDir}/waybar/*" "${workingDir}"
	echo "Waybar configured (◡‿◡✿) ..."
fi

if [ -d ${wofiDir} ]; then
	echo "Packing up existing Wofi config..."
	sleep 1
	mkdir -p "${wofiDir}old/"
	mv "${wofiDir}config" "${wofiDir}style.css" "${wofiDir}old/"
	echo "Sending over new config..."
	sleep 1
	cp "${workingDir}/wofi/*" "${wofiDir}"
	echo "Wofi configured (◡‿◡✿) ..."
else
	echo "Wofi config not found..."
	sleep 1
	echo "Creating Wofi directory..."
	mkdir -p "${wofiDir}"
	sleep 1
	echo "Sending over config..."
	sleep 1
	cp "${workingDir}/wofi*" "${wofiDir}"
	echo "Wofi configured (◡‿◡✿) ..."
fi
