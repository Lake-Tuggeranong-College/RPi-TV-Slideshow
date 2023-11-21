<!---
TODO: 
Add images
-->

# Setup Guide
This guide will teach you how to setup a PI running Raspberry Pi OS for use as a TV Slideshow client at LTC

## Installing the OS
Follow normal procedure for installing Raspberry Pi OS. 

## Getting and setting up needed Dependencies
After install, open the terminal and run the following commands
```bash
sudo apt update
sudo apt upgrade
sudo apt install jq 
```

After running these Commands, go into the Raspberry Pi config. Inside the Display Tab, turn off Screen Blanking.

After changing the screen blanking option in the RPI config, run `sudo nano /etc/hostname` and chnage the hostname inside the file. E.G `Pav2Upstairs`

### NOTE!
When chosing a hostname, it has to be one word, and can **ONLY** have letters and numbers.

## Downloading the Script and making it run on boot
Download the script by running the following command
```bash
wget -O main.sh https://raw.githubusercontent.com/Lake-Tuggeranong-College/RPi-TV-Slideshow/2023-Rewrite/main.sh
```
After downloading the script run `chmod +x ~/main.sh`

Using nano edit the `~/.profile` file (`nano ~/.profile`).

Append the following to the file
```bash
startldxe-pi&
lxterminal --command="/bin/bash -c '~/main.sh';"
```

## Setting up automatic reboot
In a terminal run `sudo crontab -e`, if prompted to choose an editor, choose nano.

At the end of the file append the following `0 0,12 * * * /sbin/reboot`

## Adding Pi to Slideshow List
Using your main computer, On the github repo, inside `SLIDESHOWLIST.json` add a new entry following the structure below
```json
"HOSTNAME": {
    "Slideshow": "SLIDESHOWURL"
}
```
Replacing `HOSTNAME` with the hostname **(NOT THE USERNAME)** of the system

Replacing `SLIDESHOWURL` with the URL to the google slides link that the pi will display

Commit and Push after done


### !!NOTE!!
The Slideshow URL needs to be a speicaly generated one, follow "Getting URL for Slideshow" to find out how to get the URL.

## Getting URL for slideshow
Using your main computer, open the google slide you wish to be displayed.

Click File, Share, Publish to Web. Copy the Following settings

Auto Advance Slides Every 10 Secounds

Start slidshow as soon as player loads

Restart the slideshow after the last slide
