#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ] #gt lt eq -ne -le -ge
then
   echo "Given Number is $NUMBER greater than 20"
else 
   echo "Given Number is $NUMBER less than 20"
fi
