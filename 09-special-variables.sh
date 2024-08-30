#!/bin/bash

echo "All Variables should be passed to script : $@"
echo "Number of Variables Passed : $#"
echo "Script Name : $0"
echo "Current Working Directory : $PWD"
echo "Home Directory  of current user: $HOME"
echo "PID Of the script executing now : $$"

sleep 100 &
echo "PID Of the last Background command : $!"