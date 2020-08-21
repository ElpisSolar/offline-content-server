#!/bin/bash

# ensure root access and password
if [ "$EUID" -ne 0 ]; then
	echo "Must be root"
	exit
fi

if [[ $# -lt 1 ]]; then
	echo "You need to pass a password!"
	echo "Usage:"
	echo "sudo $0 yourChosenPassword"
	exit
fi

# change path to current directory
parent_path=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)

# default arguments
APPASS="$1"
WLAN_SKIP="$2"
APSSID="Elpis-Solar-Hotspot"

# export args
export APPASS APSSID

# entrypoint configuration
if [ -z "$2" ]; then
	echo "Skipping hotspot configuration, setting up services only."
	./bin/service.sh
else
	./bin/wlan.sh
fi