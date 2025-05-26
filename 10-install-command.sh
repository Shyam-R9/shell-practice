#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "Error: You are not installing with root access"
    
else
    echo "You are installing with root access"

fi
