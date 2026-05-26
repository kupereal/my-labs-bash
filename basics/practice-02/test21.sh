#!/usr/bin/env bash
currentuser=`id -u -n`
echo Текущий пользователь - $currentuser

if ! [ -e /trash ]
then
    if ! [ $currentuser = "root" ]
    then
        echo "Каталог /trash не найден"
        exit 1
    fi
    mkdir /trash
    chmod a=rwx /trash
    echo "Каталог /trash создан"
fi

if ! [ -e /trash/$currentuser ]
then
    mkdir /trash/$currentuser
    chmod a=,u=rwx /trash/$currentuser
    echo "Каталог /trash/$currentuser создан"
fi

params=$@

if [ "$params" = "--clear" ]
then
    rm -r -f -d /trash/$currentuser/*
    exit 0
else
    if [ "$params" = "--clearall" ]
    then
        if ! [ $currentuser = "root" ]
        then
            echo "Вы не суперпользователь"
            exit 1
        fi
        rm -r -f -d /trash/*
        exit 0
    fi
fi

mv -f $params /trash/$currentuser
