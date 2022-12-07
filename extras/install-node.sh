#!/bin/bash

# Simple function to announce what we're doing
function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            Installing $1"
	echo "#===============================================================#"
}

announce "NodeJS Version Manager"

if ! [ -x "$(command -v nvm)" ]; then
	
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source $HOME/.bashrc

    nvm -v

    echo "NVM has been installed, enter 'nvm' for help on swapping between NodeJS versions."

else
	echo "Skipping, nvm seems to be installed."
fi


announce "Latest NodeJS Version"

if ! [ -x "$(command -v node)" ]; then
	
    nvm install --lts

    node -v
    npm -v

else
	echo "Skipping, node seems to be installed."
fi

announce "Yarn"

if ! [ -x "$(command -v yarn)" ]; then

    npm install --global yarn

else
    echo "Skipping, yarn seems to be installed."
fi

