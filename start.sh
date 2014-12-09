#! /bin/sh

python /SABnzbd/SABnzbd.py -s :8082 --config-file "/config/SABnzbd.ini"
sleep 5

tail -f /config/logs/sabnzbd.*
