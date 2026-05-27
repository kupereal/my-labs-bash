#!/bin/bash
#!/bin/expect -f

cd /home/medm/web/medicalmatter.ru
find . ${fargs[@]} -type f -print0 |\
    tar -cpf /home/medm/backup/medm.$(date '+%Y-%m-%d').tar --null -T -
find . ${fargs[@]} -type d -empty -print0 |\
    tar -rpf /home/medm/backup/medm.$(date '+%Y-%m-%d').tar --null -T -
mysqldump -umedm_user -pZf5jlRcobeldS0bbXXI6mc4Fmt4pHsSVfX8psFsv medm_mysql > /home/medm/backup/medm.$(date '+%Y-%m-%d').sql

cd /home/medm/backup
zip medm.$(date '+%Y-%m-%d').zip medm.$(date '+%Y-%m-%d').tar medm.$(date '+%Y-%m-%d').sql
rm medm.$(date '+%Y-%m-%d').tar
rm medm.$(date '+%Y-%m-%d').sql

expect -c 'spawn rsync -dr -delete /home/medm/backup/ -e ssh alex@192.168.0.2:/Volumes/500/Datafiles/coding/\[medicalmatter\]/backup
expect "Password:" {send "XXXXXXXX\r"}
interact'

ls -t /home/medm/backup/ | tail -n +8 | xargs rm -f
