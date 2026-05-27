#!/usr/bin/env bash

/usr/bin/expect -c 'spawn ssh kupereal@192.168.0.1X "uptime && free -m"
expect "Password:" { send "XXXXXXXX" }'
