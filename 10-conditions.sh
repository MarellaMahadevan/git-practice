#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ] #gt lt eq -ne -le -ge
then
   echo "Given Number $NUMBER is greater than 20"
else 
   echo "Given Number  $NUMBER is less than 20"
fi
