#!/usr/bin/env bash

set -euo pipefail

PACKAGES=(
    python3
    python3-pip
    python3-venv
)

echo "Installing Python development packages..."
sudo apt install -y "${PACKAGES[@]}"

echo "Verifying Python installation..."
python3 --version
python3 -m pip --version

echo "Python environment setup complete."
