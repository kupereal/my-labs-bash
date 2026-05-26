#!/usr/bin/env bash
a=1
b=2
for x in a b $a $b "hello world"
do
    echo $x
done
