#!/usr/bin/env bash

set -euo pipefail

PACKAGES=(
	git
	curl
	wget
	zip
	unzip
	jq
	tree
	ca-certificates
)

echo "Installing base packages..."
sudo apt install -y "${PACKAGES[@]}"

echo "Base packages installed successfully."
