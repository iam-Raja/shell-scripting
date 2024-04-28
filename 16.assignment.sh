#!/bin/bash

# Check if an input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 file.txt"
    exit 1
fi

# Read the filename from the command line argument
input_file="$1"

# Transpose the columns to rows
awk '
{
    for (i = 1; i <= NF; i++) {
        a[NR, i] = $i
    }
}
END {
    for (j = 1; j <= NF; j++) {
        for (i = 1; i <= NR; i++) {
            printf "%s%s", a[i, j], (i==NR ? "\n" : OFS)
        }
    }
}' "$input_file"