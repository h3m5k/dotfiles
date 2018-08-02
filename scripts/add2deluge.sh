#!/bin/bash

torrent="$1"
user="delugeclient"
pass=""
host="192.168.1.69"

deluge-console "connect $host $user $pass ; add $torrent ; exit"
