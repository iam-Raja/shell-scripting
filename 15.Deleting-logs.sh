#!/bin/bash

source_directory=/tmp/old_logs

R="/e[31m"
G="/e[32m"
N="/e[0m"

if [ -d $source_directory ] #-d dir it will check dir exist or not
then echo -e "$G $source_directory exists $N"
else echo -e "$R $source_directory not exist $N"
exit 1
fi

files=$(find $source_directory -name ".log" -mtime +14)

while IFS= read -r line 
do echo "deleting files: $line"
rm -rf $line
done <<< $files

