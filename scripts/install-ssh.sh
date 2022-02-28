#!/bin/bash

# Simple function to announce what we're doing
function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            Installing $1"
	echo "#===============================================================#"
}


announce "VS Code Insiders"

if ! [ -x "$(command -v ssh)" ]; then
	
	sudo apt install -y openssh-server
	
else
	echo "Skipping, SSH seems to be installed"
fi
