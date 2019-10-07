#! /bin/sh

# source: https://raspberrypi.stackexchange.com/questions/70013/raspberry-pi-3-model-b-system-leds

# Copy special file to init.d
cp led-control_3B  /etc/init.d/led-control
# setup script 
/usr/sbin/update-rc.d led-control defaults
# activate
/etc/init.d/led-control start


## INIT links to LED-SCRIPT
ln -s led_on3B.sh led_on
ln -s led_off3B.sh led_off

# Replace actual path in source file
sed -e "s@PATH_TO_SCRIPT@$PWD@" 99-tomtom.rules.src > 99-tomtom.rules
# copy modified files into udev rules
cp 99-tomtom.rules /etc/udev/rules.d
# reload settings
udevadm control --reload-rules

