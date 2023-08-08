#!/bin/bash

flag=$1

# Remove the flag from the arguments
shift

case $flag in
    -[1-6])
        script_number="${flag:1}"  # Remove the "-"
        script_path="./Exercise_$script_number/ex$script_number.sh"
        
        if [ -f "$script_path" ]; then
            echo "Running Exercise $script_number script..."
            ./Exercise_$script_number/ex$script_number.sh "$@"
        else
            echo "Exercise $script_number script not found."
        fi
        ;;
    *)
        echo "Invalid flag. Please enter a flag in the format -[1-6]."
        ;;
esac
