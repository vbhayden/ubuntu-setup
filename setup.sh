#!/bin/bash

./scripts/install-reqs.sh
./scripts/install-vsc.sh
./scripts/install-ssh.sh

./scripts/fix-permissions.sh $1

echo ""
echo "... Machine should be ready to go, Restart to let permissions go into effect."
