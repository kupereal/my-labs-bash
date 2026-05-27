#!/bin/bash
sudo /home/medm/backup.sh
cp /home/medm/backup/medm.$(date '+%Y-%m-%d').zip /home/alex/Torrents/medm.$(date '+%Y-%m-%d').zip
chown alex:alex /home/alex/Torrents/medm.$(date '+%Y-%m-%d').zip
