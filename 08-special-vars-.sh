#!/bin/bash

echo "all variales passed to the scritp: $@"
echo "number of variables passed: $#"
echo "exit code of the last command: $?"
echo "scrip name: $0:"
echo "current directory: $PWD"
echo "user running the script: $USER"
echo "home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of the last command in background: $!"

