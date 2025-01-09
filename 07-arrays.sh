#!/bin/bash

ShellScript=("variables" "DynamicVar" "VarHiding" "DataTypes" "Array" "SpecialVars")
# index starts from  0, size indicates number of arguments

echo "ShellScript first Concept: ${ShellScript[0]}"
echo "ShellScript Second Concept: ${ShellScript[1]}"
echo "ShellScript Third Concept: ${ShellScript[2]}"
echo "ShellScript Fourth Concept: ${ShellScript[3]}"
echo "ShellScript Fifth Concept: ${ShellScript[4]}"
echo "ShellScript Sixth Concept: ${ShellScript[5]}"


echo "All Shell script Concepts: ${ShellScript[@]}"
