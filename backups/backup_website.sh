#!/usr/bin/env bash

########## 7 files limit ##########

ls -t /home/vespasian/backups/server_*.zip | tail -n +7 | xargs rm -f

########## backup process ##########

tar -czPf /home/vespasian/backups/vespasian_FS_$(date '+%Y-%m-%d').tar.gz /var/www/vespasian_com_usr/data/www
mysqldump --defaults-extra-file=/etc/mysql/mysql.cnf --default-character-set=utf8mb4 --skip-opt vespasian_com_db > /tmp/vespasian_com_db.sql
tar -czPf /home/vespasian/backups/vespasian_DB_$(date '+%Y-%m-%d').tar.gz /tmp/vespasian*.sql
rm /tmp/vespasian*.sql

########## backup assembly & cleanup ##########

cd /home/vespasian/backups
zip -q server_$(date '+%Y-%m-%d').zip *$(date '+%Y-%m-%d').tar.gz
rm *$(date '+%Y-%m-%d').tar.gz

########## hdd & cloud backup process ##########
#rsync -r --delete-after /home/vespasian/backups/ /mnt/Storage/backups/
#rclone sync /home/vespasian/backups --include "server_*.zip" yandex:backups
