#!/bin/bash

# This script installs Google Chrome on a Debian/Ubuntu-based system.

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Update package lists
echo "Updating package lists..."
apt update

# Install dependencies
echo "Installing required dependencies..."
apt install -y wget gnupg

# Download the Google Chrome .deb package
echo "Downloading Google Chrome..."
wget -q -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install the .deb package using dpkg
echo "Installing Google Chrome..."
dpkg -i google-chrome-stable_current_amd64.deb || true

# Fix any missing dependencies
echo "Fixing missing dependencies..."
apt install -f -y

# Clean up
echo "Cleaning up..."
rm -f google-chrome-stable_current_amd64.deb

# Verify installation
echo "Verifying installation..."
if command -v google-chrome > /dev/null 2>&1; then
    echo "Google Chrome has been successfully installed."
else
    echo "Failed to install Google Chrome." >&2
    exit 1
fi