#!/bin/ksh
# Set the Time Machine backup interval to every 4 hours
sudo defaults write /System/Library/LaunchDaemons/com.apple.backupd-auto.plist StartInterval -int 14400
sudo defaults write /System/Library/Preferences/com.apple.LaunchServices.plist LSQuarantine -bool NO
