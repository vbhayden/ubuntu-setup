#!/bin/bash

# Simple function to announce what we're doing
function announce() {
	echo ""
	echo "#===============================================================#"
	echo "#            Installing $1"
	echo "#===============================================================#"
}


announce "Kubernetes Command-Line Tools"

if ! [ -x "$(command -v kubectl)" ]; then
	
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 

	# Validate Checksum, optional
	curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
	echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

	rm kubectl kubtctl.sha265

	kubectl version --client
	
else
	echo "Skipping, kubectl seems to be installed"
fi


announce "Minikube"

if ! [ -x "$(command -v minikube)" ]; then
	
	curl -L https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -o /tmp/minikube-linux-amd64
	install /tmp/minikube-linux-amd64 /usr/local/bin/minikube

	minikube version
	
else
	echo "Skipping, minikube seems to be installed"
fi


announce "Kompose"

if ! [ -x "$(command -v kompose)" ]; then
	
	curl -L https://github.com/kubernetes/kompose/releases/download/v1.26.1/kompose-linux-amd64 -o /tmp/kompose
    sudo install /tmp/kompose /usr/local/bin/
	
else
	echo "Skipping, kompose seems to be installed"
fi


announce "Skaffold"

if ! [ -x "$(command -v skaffold)" ]; then
	
	curl -L https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 -o /tmp/skaffold
	sudo install /tmp/skaffold /usr/local/bin/
	
else
	echo "Skipping, skaffold seems to be installed"
fi
