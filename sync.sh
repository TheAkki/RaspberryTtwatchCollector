#!/bin/sh

# load activities from watch
ttwatch --get-activities

if ping -w 5 -c 1 google.de > /dev/null; then
    echo "We are online"
    # when we are online update also gps data (for 7 days) 
    ttwatch --update-gps -7
else
    echo "We are offline"
fi

# sync write processes to mmc to avoid loosing data
sync

./led_on;
sleep 1;
./led_off;
sleep 1;
./led_on;
sleep 1;
./led_off;
sleep 1;
./led_on;
sleep 1;
./led_off;
sleep 1;
./led_on;
sleep 1;
./led_off;
sleep 1;

./led_on;

