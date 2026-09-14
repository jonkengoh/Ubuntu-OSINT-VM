#!/usr/bin/env bash

set -euo pipefail

echo "=== Ubuntu OSINT VM Verification ==="
echo

echo "Operating system:"
lsb_release -ds
echo

echo "Architecture:"
uname -m
echo

echo "Python:"
python3 --version
echo

echo "pip:"
python3 -m pip --version
echo

echo "Git:"
git --version
echo

echo "Virtual environment support:"
python3 -m venv --help >/dev/null
echo "venv: available"
echo

echo "Network connectivity:"
if wget -q --spider https://ubuntu.com; then
    echo "HTTPS connectivity: OK"
else
    echo "HTTPS connectivity: FAILED"
    exit 1
fi

echo
echo "Time synchronization:"
if [[ "$(timedatectl show --property=NTPSynchronized --value)" == "yes" ]]; then
    echo "NTP synchronization: OK"
else
    echo "NTP synchronization: FAILED"
    exit 1
fi

echo
echo "=== Verification complete ==="
