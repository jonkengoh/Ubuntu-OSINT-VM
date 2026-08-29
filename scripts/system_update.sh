#!/usr/bin/env bash

# -e Exit on command failure
# -u Treat unset variables as errors
# -o pipefail Make pipelines fail if any command in them fails
set -euo pipefail

echo "Updating package lists..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

echo "System update complete."