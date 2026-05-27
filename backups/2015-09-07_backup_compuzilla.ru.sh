#!/bin/bash
#!/bin/expect -f

cd /home/cpuz/web/compuzilla.ru
find . ${fargs[@]} -type f -print0 |\
    tar -cpf /home/cpuz/backup/cpuz.$(date '+%Y-%m-%d').tar --null -T -
find . ${fargs[@]} -type d -empty -print0 |\
    tar -rpf /home/cpuz/backup/cpuz.$(date '+%Y-%m-%d').tar --null -T -
mysqldump -ucpuz_user -pLfMpAiu7Ngb-aXsHxCD8kKJhr5_yUQZWw63q4Sjn cpuz_mysql > /home/cpuz/backup/cpuz.$(date '+%Y-%m-%d').sql

cd /home/cpuz/backup
zip cpuz.$(date '+%Y-%m-%d').zip cpuz.$(date '+%Y-%m-%d').tar cpuz.$(date '+%Y-%m-%d').sql
rm cpuz.$(date '+%Y-%m-%d').tar
rm cpuz.$(date '+%Y-%m-%d').sql

expect -c 'spawn rsync -dr -delete /home/cpuz/backup/ -e ssh alex@192.168.0.2:/Volumes/500/Datafiles/coding/\[compuzilla\]/backup
expect "Password:" {send "XXXXXXXX\r"}
interact'

ls -t /home/cpuz/backup/ | tail -n +8 | xargs rm -f
