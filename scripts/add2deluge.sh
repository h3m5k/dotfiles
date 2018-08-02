#!/bin/bash

torrent="$1"
user="delugeclient"
pass=""
host="192.168.1.69"


if [ -z "$torrent" ]; then
  /usr/bin/notify-send -t 7000 "ERROR: No input."
  exit
fi

# Prettify torrent name for notifications
pretty_torrent=$(echo $torrent | egrep -o "&dn=[^%]+%" | sed -r 's/^&dn=//' | cut -d'%' -f1 | sed -r 's/\+/ /g')

# Send to deluge
deluge-console "connect $host $user $pass ; add $torrent ; exit"

# Notify
if [ "$?" == "0" ]; then
  /usr/bin/notify-send -t 7000 "Added $pretty_torrent"
else
  /usr/bin/notify-send -t 7000 "Failed to add $pretty_torrent "
fi
