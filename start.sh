#! /bin/sh

python /SABnzbd/SABnzbd.py -s :8082
sleep 5

tail -f /config/logs/sabnzbd.*
