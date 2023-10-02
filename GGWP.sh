#!/bin/sh
mkdir /volumes/untitled/tmp
cd /volumes/untitled/tmp
sleep 5
ECHO "Downloading MacOS Sonoma 14.0 Install Assistant.pkg"
curl -OL --progress-bar https://swcdn.apple.com/content/downloads/26/09/042-58988-A_114Q05ZS90/yudaal746aeavnzu5qdhk26uhlphm3r79u/InstallAssistant.pkg
sleep 5
ECHO "Installing Sonoma 14.0 Install Assistant @ /volumes/Untitled/Applications/"
installer -verboseR -pkg /volumes/untitled/tmp/InstallAssistant.pkg -target "/volumes/untitled/"
sleep 5
cd "/volumes/untitled/applications/Install MacOS Sonoma.app/contents/macos"
sleep 5
ECHO "Opening MacOS Sonoma"
"./InstallAssistant_springboard"
