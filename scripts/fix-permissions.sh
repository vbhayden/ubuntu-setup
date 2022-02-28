#!/bin/bash

function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            $1"
	echo "#===============================================================#"
}


announce "Adding Docker Non-Root Permissions"

groupadd docker
usermod -aG docker $1