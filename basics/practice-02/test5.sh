#!/bin/bash
a=10 b='$a' c='$b'
echo $c
eval echo $c
eval eval echo $c
echo ------------------------------
aa='(2*2+2)/3'
bb='$(($aa))'
eval echo $bb
