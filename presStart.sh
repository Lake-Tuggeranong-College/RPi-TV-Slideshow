#!/bin/bash
sleep 60
sudo ntpd -q -g
#unclutter -idle 0.1
python google_sheets.py
sudo service ntp stop
sudo ntpdate 203.62.5.5
sudo service ntp start
vncserver :1 -geometry 1920x1080 -depth 24 -dpi 96
/usr/bin/chromium --noerrdialogs --kiosk "https://docs.google.com/presentation/d/e/2PACX-1vR-HWf8y66AXuDejREzaIu_TObr9x2GgDkbwucy2XbvHw9QBUjDwfu0mIHg6FP6sRuu5MGzyLsV-QRr/pub?start=true&loop=true&delayms=10000" --incognito
