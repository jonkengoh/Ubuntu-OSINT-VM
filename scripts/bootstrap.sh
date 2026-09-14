#!/usr/bin/env bash

set -euo pipefail

sudo -v

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

echo "Ubuntu OSINT VM bootstrap"
echo "Repository root: $REPO_ROOT"

echo
echo "Running system update..."
"$REPO_ROOT/scripts/system_update.sh"

echo
echo "Installing base packages..."
"$REPO_ROOT/scripts/packages.sh"

echo
echo "Configuring unattended security updates..."
"$REPO_ROOT/scripts/security_updates.sh"

echo
echo "Setting up Python environment..."
"$REPO_ROOT/scripts/python.sh"

echo
echo "Running environment verification..."
"$REPO_ROOT/scripts/verify.sh"

echo
echo "Bootstrap complete."
