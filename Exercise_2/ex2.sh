#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Enter: ./my_script.sh <name of file> <desired separator>"
  exit 1
fi

file="$1"
if [ ! -f "$file" ]; then
 echo "the file not exsist"
 exit 1
fi

separator="$2"

# Set IFS (Internal Field Separator) to the specified separator
IFS="$separator"

# Iterate through each line in the file
while read -r line; do
  fields=($line)  
  num_fields=${#fields[@]}  

  # Print each field with its index
  for ((i = 0; i < num_fields; i++)); do
    echo "field $((i + 1)): ${fields[i]}"
  done
done < "$file"

# Reset IFS to its default value (space, tab, newline)
IFS=$' \t\n'
