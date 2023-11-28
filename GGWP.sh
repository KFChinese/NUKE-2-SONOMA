#!/bin/sh

# Define paths
TMP_DIR="/Volumes/Macintosh HD/tmp"
PKG_PATH="$TMP_DIR/InstallAssistant.pkg"
INSTALL_PATH="/volumes/Macintosh HD/applications/Install MacOS Sonoma.app/contents/macos"

# Starts Caffeinate, Prevents sleep
caffeinate -d &

# Store the PID (Process ID) of the backgrounded caffeinate command
CAFFEINATE_PID=$!

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

# Somoma Logo
echo " _                          _       __  __           _                   "
echo "| |    __ _ _ __ _ __ _   _( )___  |  \/  | ___   __| |___               "
echo "| |   / _\` | '__| '__| | | |// __| | |\/| |/ _ \ / _\` / __|              "
echo "| |__| (_| | |  | |  | |_| | \__ \ | |  | | (_) | (_| \__ \              "
echo "|_____\__,_|_|  |_|   \__, | |___/ |_|  |_|\___/ \__,_|___/              "
echo " __  __             __|___/__    ____                                    "
echo "|  \/  | __ _  ___ / _ \/ ___|  / ___|  ___  _ __   ___  _ __ ___   __ _ "
echo "| |\/| |/ _\` |/ __| | | \___ \  \___ \ / _ \| '_ \ / _ \| '_ \` _ \ / _\` |"
echo "| |  | | (_| | (__| |_| |___) |  ___) | (_) | | | | (_) | | | | | | (_| |"
echo "|_|_ |_|\__,_|\___|\___/|____/  |____/ \___/|_| |_|\___/|_| |_| |_|\__,_|"
echo "|_ _|_ __  ___| |_ __ _| | |                                              "
echo " | || '_ \/ __| __/ _\` | | |                                              "
echo " | || | | \__ \ || (_| | | |                                              "
echo "|___|_| |_|___/\__\__,_|_|_|                                              "
echo ""

echo ""
echo "Updated for 14.1.1 (11/7)"

# Download MacOS Sonoma Install Assistant
echo "Downloading MacOS Sonoma Install Assistant"
curl -OL --progress-bar https://swcdn.apple.com/content/downloads/21/44/042-95491-A_FOGL4I4EYF/3tg1hvswl45u0svckb2vuel8hr5eeznpid/InstallAssistant.pkg
if [ $? -ne 0 ]; then
    echo "Error: Failed to download InstallAssistant.pkg"
    exit 1
fi

sleep 5
kill $CAFFEINATE_PID

# Install Sonoma Install Assistant
echo "Installing Sonoma Install Assistant"
installer -store -verboseR -dumplog -pkg "$PKG_PATH" -target /Volumes/Macintosh\ HD/
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
