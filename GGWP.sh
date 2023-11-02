#!/bin/sh
mkdir "/volumes/Macintosh HD/tmp"
cd "/volumes/Macintosh HD/tmp"

sleep 2
ECHO "Downloading MacOS Sonoma Install Assistant"
curl -OL --progress-bar https://swcdn.apple.com/content/downloads/39/32/042-86434-A_HKAQU4T2OA/y8aibplm2qgy1ce8ux8fxy1efgsbvprgp2/InstallAssistant.pkg
sleep 5
ECHO "Installing Sonoma Install Assistant"
installer -verboseR -pkg "/volumes/Macintosh HD/tmp/InstallAssistant.pkg" -target "/volumes/Macintosh HD/"
sleep 5
cd "/volumes/Macintosh HD/applications/Install MacOS Sonoma.app/contents/macos"
sleep 5
ECHO "Opening MacOS Sonoma"
"./InstallAssistant_springboard"
