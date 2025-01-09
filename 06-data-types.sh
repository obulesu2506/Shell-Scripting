#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)
echo "Script executing at: $TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))

echo "SUM of $NUMBER1 and $NUMBER2 are: $SUM"
