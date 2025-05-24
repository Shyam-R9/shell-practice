#!/bin/bash

NUMBER1=100
NUMBER2=200

TIMESTAMP = $(time)

echo " script executed at $TIMESTAMP"

SUM = $((NUMBER1+NUMBER2))

echo " Sum of the $NUMBER1 and $NUMBER2 is $SUM"
