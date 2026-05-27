#!/bin/bash

#переменные для кириллицы
set meta-flag on
set convert-meta off
set output-meta on

#определение текущего пользователя
#currentuser=`id -u -n`
#echo $currentuser

#резервное копирование
cd /home/medm/web/medicalmatter.ru
find . ${fargs[@]} -type f -print0 |\
    tar -cpf /home/alex/Backup/medm.$(date '+%Y-%m-%d').tar --null -T -
find . ${fargs[@]} -type d -empty -print0 |\
    tar -rpf /home/alex/Backup/medm.$(date '+%Y-%m-%d').tar --null -T -
mysqldump -umedm_user -pZf5jlRcobeldS0bbXXI6mc4Fmt4pHsSVfX8psFsv medm_mysql > /home/alex/Backup/medm.$(date '+%Y-%m-%d').sql

#архивирование, удаление хвостов, смена прав
cd /home/alex/Backup
zip medm.$(date '+%Y-%m-%d').zip medm.$(date '+%Y-%m-%d').tar medm.$(date '+%Y-%m-%d').sql
rm medm.$(date '+%Y-%m-%d').tar
rm medm.$(date '+%Y-%m-%d').sql
ls -t /home/alex/Backup | tail -n +8 | xargs rm -f
chown alex:alex /home/alex/Backup/medm.$(date '+%Y-%m-%d').zip
