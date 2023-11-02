#!/bin/sh

# Define paths
TMP_DIR="/Volumes/Macintosh HD/tmp"
PKG_PATH="$TMP_DIR/InstallAssistant.pkg"
INSTALL_PATH="/volumes/Macintosh HD/applications/Install MacOS Sonoma.app/contents/macos"

# Create temp directory
mkdir "$TMP_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory $TMP_DIR"
    exit 1
fi

cd "$TMP_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to change directory to $TMP_DIR"
    exit 1
fi

# Download MacOS Sonoma Install Assistant
echo "Downloading MacOS Sonoma Install Assistant"
curl -OL --progress-bar https://swcdn.apple.com/content/downloads/39/32/042-86434-A_HKAQU4T2OA/y8aibplm2qgy1ce8ux8fxy1efgsbvprgp2/InstallAssistant.pkg
if [ $? -ne 0 ]; then
    echo "Error: Failed to download InstallAssistant.pkg"
    exit 1
fi

sleep 5

# Install Sonoma Install Assistant
echo "Installing Sonoma Install Assistant"
installer -verboseR -pkg "$PKG_PATH" -target "/Volumes/Macintosh HD"
if [ $? -ne 0 ]; then
    echo "Error: Failed to install InstallAssistant.pkg"
    exit 1
fi

sleep 5

cd "$INSTALL_PATH"
if [ $? -ne 0 ]; then
    echo "Error: Failed to change directory to $INSTALL_PATH"
    exit 1
fi

sleep 5

# Open MacOS Sonoma
echo "Opening MacOS Sonoma"
./InstallAssistant_springboard
if [ $? -ne 0 ]; then
    echo "Error: Failed to open MacOS Sonoma"
    exit 1
fi

# Optionally, clean up the temporary directory
# rm -rf "$TMP_DIR"
