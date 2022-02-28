#!/bin/bash

# Simple function to announce what we're doing
function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            Installing $1"
	echo "#===============================================================#"
}


announce "VS Code Insiders"

if ! [ -x "$(command -v code-insiders)" ]; then
	
	sudo snap install code-insiders --classic
	
else
	echo "Skipping, VS Code Insiders is already installed!"
fi
