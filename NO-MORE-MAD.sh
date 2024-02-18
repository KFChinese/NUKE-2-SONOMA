## Get the current user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk "{ print $3 }"`

# unload LaunchAgent
launchctl unload /Library/LaunchAgents/com.trusourcelabs.NoMAD.plist
launchctl unload "/Users/$loggedInUser/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"

# Kill NoMAD process
pkill NoMAD


# Remove Files
sudo rm -rf "/Applications/NoMAD.app"
sudo rm -rf "/Library/Managed Preferences/com.trusourcelabs.NoMAD.plist"
sudo rm -rf "/Library/Managed Preferences/$loggedInUser/com.trusourcelabs.NoMAD.plist"
sudo rm -rf "/Users/$loggedInUser/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"

sudo rm -rf "/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"

cd ~/Downloads

curl -O -L https://github.com/BIG-RAT/mobile_to_local/releases/download/v2.5.2/Mobile.to.Local.zip

set +e  # Disable exit on error
ditto -x -k ~/Downloads/Mobile.to.Local.zip ~/Downloads
set -e  # Re-enable exit on error

sudo ~/Downloads/Mobile\ to\ Local.app/Contents/MacOS/Mobile\ to\ Local
