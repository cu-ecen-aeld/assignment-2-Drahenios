!/bin/sh
# ------------------------------------------------------------------
#  Script: writer.sh
#  Purpose: Write a string to a file, creating the directory path if needed.
#  Usage:  ./writer.sh <writefile> <writestr>
# ------------------------------------------------------------------

# -------------------------------------------------
# 1. Verify that exactly two arguments were given
# -------------------------------------------------
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required." >&2
    echo "Usage: $0 <writefile> <writestr>" >&2
    exit 1
fi

writefile=$1
writestr=$2

# -------------------------------------------------
# 2. Ensure the destination directory exists
# -------------------------------------------------
dirpath=$(dirname "$writefile")
if ! mkdir -p "$dirpath"; then
    echo "Error: Could not create directory path \"$dirpath\"." >&2
    exit 1
fi

# -------------------------------------------------
# 3. Write (or overwrite) the string to the file
# -------------------------------------------------
if ! echo "$writestr" >"$writefile"; then
    echo "Error: Could not write to file \"$writefile\"." >&2
    exit 1
fi

echo "Successfully wrote to \"$writefile\"."
