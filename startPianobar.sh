#!/bin/sh

# create the devices.yaml before 
if [ ! -f ~/.config/pianobar/config ]
then
 mkdir -p ~/.config/pianobar
 cat <<EOF > ~/.config/pianobar/config
user = ${PANDORA_USERNAME:-undefined_username}
password = ${PANDORA_PASSWORD:-undefined_password}
EOF
fi

/etc/init.d/dbus start

bluetoothd --debug  &
/bin/bash

#firetv-server -c '/config/devices.yaml'
