#!/bin/bash

waitForNetworkConnection() {
    while [ "$res" != "200" ]
    do
    res=$(curl -Is https://www.example.com | awk '/^HTTP/{print $2}')
    echo $res
	sleep 30
	done
}


waitForNetworkConnection


sudo timedatectl set-ntp off
dateTimeAPIResponse=$(curl "http://worldtimeapi.org/api/timezone/Australia/Sydney")
unixTime=$(echo $dateTimeAPIResponse | jq .unixtime)
sudo date -s @$unixTime

HOSTNAME=$(hostname)

echo $HOSTNAME

# Retrave URL HostName Key Value Pair List from the github repo
LIST=$(curl https://raw.githubusercontent.com/Lake-Tuggeranong-College/RPi-TV-Slideshow/2023-Rewrite/SLIDESHOWLIST.json)

echo $LIST

jqFilter=$(echo .$HOSTNAME.Slideshow)

echo $jqFilter

SLIDESHOWURL=$(echo $LIST | jq $jqFilter)

if [ $SLIDESHOWURL = "null" ]
then
SLIDESHOWURL=$(echo $LIST | jq '.GENERIC.Slideshow')
fi

echo $SLIDESHOWURL

SLIDESHOWURL=${SLIDESHOWURL/'"'/}
SLIDESHOWURL=${SLIDESHOWURL/'"'/}

chromium-browser $SLIDESHOWURL --kiosk --incongnito




