#!/bin/bash

OUT1=$(ps -ef)
OUT2=$(pss -ef)
OUT3=$(df)
echo "$OUT1"
echo "$OUT2"
echo "$OUT3"
