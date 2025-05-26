#!/bin/bash

USERID=$(id -u)

if [$USERID -eq 0]; then
    echo "You are working with root access"
else:
    echo " you are not a root user"

dnf list installed mysql

