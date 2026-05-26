#!/usr/bin/env bash
while [ $# -gt 0 ] ; do
    case "$1" in
        -gm) echo "Dobroe utro, $2"; shift 2 ;;
        -ga) echo "Dobrii den, $2"; shift 2 ;;
        -ge) echo "Dobrii vecher, $2"; shift 2 ;;
        -he) echo "Privet"; shift ;;
        -dg) echo "Segodnia solnechnii den"; shift ;;
        -dr) echo "Segodnia pasmurnii den"; shift ;;
        -y) echo "Da"; shift ;;
        -n) echo "Net"; shift ;;
    esac
done
-ga Foo -he -dg -y
