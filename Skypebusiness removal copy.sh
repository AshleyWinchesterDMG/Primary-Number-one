#!/bin/sh

consoleuser=$(ls -l /dev/console | awk '{ print $3 }')

echo "logged in user is" $consoleuser

pkill -f Skype

security delete-generic-password -l "Skype for Business" /Users/$consoleuser/Library/Keychains/login.keychain

folders=(
"/Applications/Skype for Business.app"
"/Library/Internet Plug-Ins/MeetingJoinPlugin.plugin"
#
"/Users/$consoleuser/Library/Containers/com.microsoft.SkypeForBusiness"
"/Users/$consoleuser/Library/Logs/LwaTracing"
"/Users/$consoleuser/Library/Saved Application State/com.microsoft.SkypeForBusiness.savedState"
"/Users/$consoleuser/Library/Preferences/com.microsoft.SkypeForBusiness.plist"
)

search="*"


for i in "${folders[@]}"
do
    echo "removing folder ${i}"
    rm -rf "${i}"
done

if [ $? == 0 ]; then
     echo "Success"
else
     echo "Failure"
fi