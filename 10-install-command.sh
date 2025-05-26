#!/bin/bash

out1 = $(ps -ef)
out2 = $(pss -ef)
out3 = $(df)
echo "$out1"
echo "$out2"
echo "$out3"
