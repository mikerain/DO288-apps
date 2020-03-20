#!/bin/sh

if [ "$(id -u)" != '0' ]; then
  echo 'Run this script either as root or using sudo'
  exit 1
fi

firewall-cmd --zone=trusted --add-port 5000/tcp --permanent
firewall-cmd --reload
