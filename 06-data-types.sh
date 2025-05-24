#!/bin/bash
echo "enter first number"
read NUMBER1

echo "enter second number"
read NUMBER2

TIMESTAMP=$(date)

echo " Script executed at $TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))

echo " Sum of the $NUMBER1 and $NUMBER2 is $SUM"
