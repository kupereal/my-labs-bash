#!/bin/bash
a=5 b="Hello world" c=$a+$b d='$a+$b' e=\$a
echo -e a=$a\nb=$b\nc=$c\nd=$d\ne=$e
echo ------------------------------
echo -e 'a=$a\nb=$b\nc=$c\nd=$d\ne=$e'
echo ------------------------------
echo -e "a=$a\nb=$b\nc=$c\nd=$d\ne=$e"
