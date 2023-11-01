#!/bin/sh
mkdir /volumes/untitled/tmp
cd /volumes/untitled/tmp
echo""
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

sleep 2
ECHO "Downloading MacOS Sonoma 14.0 Install Assistant.pkg"
curl -OL --progress-bar https://swcdn.apple.com/content/downloads/39/32/042-86434-A_HKAQU4T2OA/y8aibplm2qgy1ce8ux8fxy1efgsbvprgp2/InstallAssistant.pkg
sleep 5
ECHO "Installing Sonoma 14.0 Install Assistant @ /volumes/Untitled/Applications/"
installer -verboseR -pkg /volumes/untitled/tmp/InstallAssistant.pkg -target "/volumes/untitled/"
sleep 5
cd "/volumes/untitled/applications/Install MacOS Sonoma.app/contents/macos"
sleep 5
ECHO "Opening MacOS Sonoma"
"./InstallAssistant_springboard"
