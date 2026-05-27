#!/usr/bin/env bash

########## 4 files limit ##########

cd /media/storage
ls -t /media/storage/server_*.zip | tail -n +4 | xargs rm -f

########## backup process ##########

# user - kupl
tar -czPf /media/storage/kupl_FS_$(date '+%Y-%m-%d').tar.gz /var/www/kupl/data/www
mysqldump --defaults-extra-file=/etc/mysql/mysql.cnf --default-character-set=utf8mb4 --skip-opt kupl_com_main > /tmp/kupl_com_main.sql
mysqldump --defaults-extra-file=/etc/mysql/mysql.cnf --default-character-set=utf8mb4 --skip-opt kupl_com_kb > /tmp/kupl_com_kb.sql
mysqldump --defaults-extra-file=/etc/mysql/mysql.cnf --default-character-set=utf8mb4 --skip-opt kupl_com_lp > /tmp/kupl_com_lp.sql
mysqldump --defaults-extra-file=/etc/mysql/mysql.cnf --default-character-set=utf8mb4 --skip-opt kupl_com_smm > /tmp/kupl_com_smm.sql
tar -czPf /media/storage/kupl_DB_$(date '+%Y-%m-%d').tar.gz /tmp/kupl*.sql
rm /tmp/kupl*.sql

# user - ghost
tar -czPf /media/storage/ghost_FS_$(date '+%Y-%m-%d').tar.gz /var/www/ghost/data/www

########## backup assembly & cleanup ##########

zip -q server_$(date '+%Y-%m-%d').zip *$(date '+%Y-%m-%d').tar.gz
rm *$(date '+%Y-%m-%d').tar.gz

########## cloud backup process ##########
rclone sync /media/storage --include "server_*.zip" remote:backups
