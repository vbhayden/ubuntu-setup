#!/bin/bash

# Simple function to announce what we're doing
function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            Installing $1"
	echo "#===============================================================#"
}


if [$# -ne 1]; then
    echo "You must provide a version of NodeJS to install (12, 14, 16, etc.)"
    exit 1
fi


announce "NodeJS"

if ! [ -x "$(command -v node)" ]; then
	
	curl -sL "https://deb.nodesource.com/setup_$1.x" -o /tmp/nodesource_setup.sh
    bash /tmp/nodesource_setup.sh

    apt install -y nodejs

	node -v

else
	echo "Skipping, node seems to be installed."
    echo "You may need to uninstall the current version with 'apt remove nodejs'"
fi