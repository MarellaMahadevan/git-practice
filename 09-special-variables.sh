#!/bin/bash

echo "All varibles passed to the script :- $@ "
echo "Number of variables passed:- $#"
echo "script name:- $0"
echo "present working directory : $PWD"
echo "Current Home directory :- $HOME"
echo "processing id of the current script $$"

sleep 100 &

echo "PID of the background command $!"