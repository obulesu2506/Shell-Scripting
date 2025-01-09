#!/bin/bash

NUMBER=$1

# -gt,-lt, -ge, -le, -e

if [$NUMBER -gt 0]
then
    echo "Given Input Number $NUMBER is greater than zero"
else
    echo "Given Input number $NUMBER is less than or equal to zero"
fi

