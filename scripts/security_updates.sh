#!/usr/bin/env bash

set -euo pipefail

echo "Installing unattended-upgrades..."
sudo apt install -y unattended-upgrades

echo "Enabling periodic unattended upgrades..."
sudo dpkg-reconfigure -f noninteractive unattended-upgrades

echo "Verifying unattended-upgrades service..."
systemctl is-enabled unattended-upgrades
systemctl is-active unattended-upgrades

echo "Unattended security updates configured successfully."
