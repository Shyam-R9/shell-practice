#!/bin/bash

OUT1=$(dff -ef)
OUT2=$(df -ef)
OUT3=$(id -u)
echo "$OUT1"
echo "$OUT2"
echo "$OUT3"
