#!/bin/sh
# --------------------------------------------------------------
#  Script: finder.sh
#  Purpose: Report the number of regular files in a directory tree
#           and the number of lines that contain a given string.
#  Usage:   ./finder.sh <filesdir> <searchstr>
# --------------------------------------------------------------

# -------------------------------------------------
# 1. Verify that exactly two arguments were supplied
# -------------------------------------------------
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required." >&2
    echo "Usage: $0 <filesdir> <searchstr>" >&2
    exit 1
fi

filesdir=$1
searchstr=$2

# -------------------------------------------------
# 2. Make sure the first argument is a directory
# -------------------------------------------------
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory." >&2
    exit 1
fi

# -------------------------------------------------
# 3. Count regular files (recursively)
# -------------------------------------------------
file_count=$(find "$filesdir" -type f | wc -l)

# -------------------------------------------------
# 4. Count lines that contain the search string
# -------------------------------------------------
# Using -n forces grep to output one line per match, which wc -l then counts.
matching_lines=$(grep -r -n "$searchstr" "$filesdir" | wc -l)

# -------------------------------------------------
# 5. Print the result
# -------------------------------------------------
echo "The number of files are $file_count and the number of matching lines are $matching_lines"
