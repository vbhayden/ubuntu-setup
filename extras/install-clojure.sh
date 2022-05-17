#!/bin/bash

# Simple script to install clohure a fresh Ubuntu 20.04 machine
function announce() {
	echo ""
	echo "#====================================================#"
	echo "#"
	echo "#            Installing $1"
	echo "#"
	echo "#====================================================#"
}

# Curl
#
announce "Curl"

if ! [ -x "$(command -v curl)" ]; then
	
	# Curl is easy
	apt-get install curl -y
	
else
	echo "Skipping, Curl already installed!"
fi

# Java
#
announce "openjdk"

if ! [ -x "$(command -v java)" ]; then

	#Jdk should be easy
	apt install openjdk-8-jdk -y
else
	echo "Skipping, openjdk already installed!"
fi

#bash
#
announce "bash"
if ! [ -x "$(command -v bash)" ]; then
	apt install bash
else
	echo "Skipping, bash already installed!"
fi

#rlwrap
#
announce "rlwrap"
if ! [ -x "$(command -v rlwrap)" ]; then
	apt install rlwrap
else
	echo "Skipping, rlwrap already installed!"
fi

#Leiningen
#
announce "Leiningen"
if ! [ -x "$(command -v lein)" ]; then

	#Download lein script
	curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein
	
	#Move the script to the user programs directory
	sudo mv lein /usr/local/bin/lein
	
	#Add execute permissions
	sudo chmod a+x /usr/local/bin/lein
else
	echo "Skipping, Leiningen already installed!"
fi

#Clojure
#
announce "Clojure"
if ! [ -x "$(command -v clojure)" ]; then

	#Download install script
	curl -O https://download.clojure.org/install/linux-install-1.10.2.774.sh
	
	#Add execute permissions
	chmod +x linux-install-1.10.2.774.sh
	
	#Run
	./linux-install-1.10.2.774.sh

else
	echo "Skipping, Closure already installed!"
fi

#NodeJS
#
announce "NodeJS"
if ! [ -x "$(command -v node)" ]; then
	#get the version 12 of node
	curl -sL https://deb.nodesource.com/setup_12.x | bash -
	
	#install
	apt install nodejs

else
	echo "Skipping, NodeJS already installed!"
fi


echo ""
echo "clojureshould be ready."
echo ""
