#!/usr/bin/env bash
for x in `./test13.sh`    # современный стиль for x in $(./test13.sh)
do
    echo $x
done
# но каждый символ будет на отдельной строке
