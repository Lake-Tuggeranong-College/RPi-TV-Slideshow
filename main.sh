#! /bin/bash/

waitForNetworkConnection

# Update and Install packags
sudo apt update

HOSTNAME=$(hostname)

# Retrave MACADDRESS List from the github repo
LIST=$(curl https://raw.githubusercontent.com/Lake-Tuggeranong-College/RPi-TV-Slideshow/2023-Rewrite/SLIDESHOWLIST.json)

SLIESHOWURL=$(jq '.$HOSTNAME.Slideshow' LIST)


chromium-browser $SLIESHOWURL --kiosk --incongnito



waitForNetworkConnection () {
    while [ "$responce" != "200" ]
    do
    res=$(curl -Is https://www.google.com | awk '/^HTTP/{print $2}')
    done
}





