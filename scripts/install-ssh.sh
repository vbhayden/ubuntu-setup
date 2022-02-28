#!/bin/bash

# Simple function to announce what we're doing
function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            Installing $1"
	echo "#===============================================================#"
}


announce "OpenSSH Server"

#if ! [ -x "$(command -v ssh)" ]; then
	
	sudo apt install -y openssh-server
	
#else
#	echo "Skipping, SSH seems to be installed"
#fi


announce "Net Tools for ifconfig"

if ! [ -x "$(command -v ifconfig)" ]; then
	
	sudo apt install -y net-tools
	
else
	echo "Skipping, Net Tools seems to be installed"
fi