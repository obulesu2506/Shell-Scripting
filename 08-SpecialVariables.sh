#!/bin/bash

echo "All Variables Passed: $@"
echo "Number of Variables: $#"
echo "Script Name: $0"
echo "Present Working Directory: $PWD"
echo "Home Directory of the current user: $HOME"
echo "Which user is running this current script: $USER"
echo "Process ID of the Current Script: $$"
sleep 30 &
# & indicates that the sleep command should execute in background rather than foreground
echo "Process ID of the last command in background: $!"
