#!/usr/bin/env bash
num=$RANDOM
tries=20
usernum=0
while [ $tries -ne 0 ]
do
    read usernum
    tries=`expr $tries - 1`
    if [ $num -gt $usernum ]
    then echo "Задуманное число больше"
        elif [ $num -lt $usernum ]
        then echo "Задуманное число меньше"
    else
        echo "Вы отгадали число"
        exit 0
    fi
done
echo "Число равно $num"
