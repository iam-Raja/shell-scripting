#!/bin/bash

: ' x=$1

if [ $x -eq 45 ]
then
echo "given is $x is=45"
else
echo "given no is $x is!=45"
fi '

no1=$1
no2=$2

if [ $no1 -eq $no2 ]
then 
echo " both $no1 and $no2 are eua1"
else 
echo " given $no1 and $no2 are not eua1"
fi


# -gt, -lt, -eq, -ge, -le