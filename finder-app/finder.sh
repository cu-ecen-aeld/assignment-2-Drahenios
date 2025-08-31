#!/bin/sh
# Author: Xabier Legaspi

# Script to find the number of files within a file directory
# and number of lines containing a string.

# Check for two arguments
if [$# -ne 2]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if any of the arguments is an empty string
if [-z filesdir]; then
    echo "Error: <filesdir> must be specified." >&2
    exit 1
fi

if [-z searchstr]; then
    echo "Error: <searchstr> must be specified." >&2
    exit 1
fi

# Check if filesdir is a valid directory
if [-d filesdir]; then
    echo "Error: $filesdir is not a directory." >&2
    exit 1
fi

# Count number of files in directory and subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count number of matching lines
matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print result
echo "The number of files are $file_count and the number of matching lines are $matching_lines"
