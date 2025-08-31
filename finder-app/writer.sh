#!/bin/sh
# Author: Xabier Legaspi

# Script to create or overwrite a file with a specified string.

# Check for two arguments
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
if ! mkdir -p "$dirpath"; then
    echo "Error: Could not create directory path $dirpath" >&2
    exit 1
fi

# Try to write the string to the file, overwriting if it exists or creating if it doesn't
if ! echo "$writestr" >"$writefile"; then
    echo "Error: Could not write to file $writefile" >&2
    exit 1
fi
