#!/bin/bash

waitForNetworkConnection() {
    while [ "$res" != "200" ]
    do
    res=$(curl -Is https://www.google.com | awk '/^HTTP/{print $2}')
    echo $res
	done
}


waitForNetworkConnection


HOSTNAME=$(hostname)

echo $HOSTNAME

# Retrave URL HostName Key Value Pair List from the github repo
LIST=$(curl https://raw.githubusercontent.com/Lake-Tuggeranong-College/RPi-TV-Slideshow/2023-Rewrite/SLIDESHOWLIST.json)

echo $LIST

jqFilter=$(echo .$HOSTNAME.Slideshow)

echo $jqFilter

SLIDESHOWURL=$(echo $LIST | jq $jqFilter)

echo $SLIDESHOWURL

SLIDESHOWURL=${SLIDESHOWURL/'"'/}
SLIDESHOWURL=${SLIDESHOWURL/'"'/}

chromium-browser $SLIDESHOWURL --kiosk --incongnito





