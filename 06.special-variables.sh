#!/bin/bash

echo "all values:$@"
echo "no of values passsed:$#"
echo "current dir:$PWD"
echo "home dir of current user:$HOME"
echo "which user is runnning script:$USER"
echo "hostname:$HOSTNAME"
echo "PID of current script:$$"
sleep 50
echo "PID of last background scripr:$!"