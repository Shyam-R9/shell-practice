#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "You are working with root access"
else
    echo " you are not a root user"
    echo " your eid is $(iiid -u)"
    echo "your elseid is $(id -u)"
fi
df
dnf install mysql
echo "your id is $(id -u)"
