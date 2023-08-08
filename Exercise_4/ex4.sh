#!/bin/bash

# Associative array to map letters to decimal values
declare -A letter_values
letter_values=(
  [a]=97 [b]=98 [c]=99 [d]=100 [e]=101 [f]=102 [g]=103 [h]=104 [i]=105 [j]=106 [k]=107 [l]=108
  [m]=109 [n]=110 [o]=111 [p]=112 [q]=113 [r]=114 [s]=115 [t]=116 [u]=117 [v]=118 [w]=119 [x]=120
  [y]=121 [z]=122 [A]=65 [B]=66 [C]=67 [D]=68 [E]=69 [F]=70 [G]=71 [H]=72 [I]=73 [J]=74 [K]=75
  [L]=76 [M]=77 [N]=78 [O]=79 [P]=80 [Q]=81 [R]=82 [S]=83 [T]=84 [U]=85 [V]=86 [W]=87 [X]=88 [Y]=89 [Z]=90
  [' ']=32
)


# Function to print the decimal value of a letter
print_decimal_value() {
    local letter=$1
    local ascii_value=${letter_values["$letter"]}
    echo "$letter-$ascii_value"
}


total_sum=0

# Read letters from command-line arguments or user-input
if [ $# -eq 0 ]; then # No arguments from CLI
    while true; do
        read -p "Enter a word (or 'quit' to stop): " input
        if [ "$input" == "quit" ]; then  # Exit the script
            break
        else
            for (( i=0; i<${#input}; i++ )); do # Loop to print the decimal value of the word
                char="${input:i:1}"
                if [ ${#char} -eq 1 ] && [[ "$char" =~ [a-zA-Z] ]]; then # valid character
                    print_decimal_value "$char"
                    total_sum=$((total_sum + ${letter_values["$char"]}))
                elif [ "$char" == " " ]; then 
                    echo
                else
                    echo "Invalid character: $char. Please enter valid letters or 'quit'."
                fi
            done
        fi
    done
echo
else # Arguments from the CLI
    for word in "$@"; do
        for (( i=0; i<${#word}; i++ )); do
            char="${word:i:1}"
            if [[ "$char" =~ [a-zA-Z] ]]; then
                print_decimal_value "$char"
                total_sum=$((total_sum + ${letter_values["$char"]}))
            else
                echo "Invalid character: $char in argument '$word'. Please provide valid letters."
            fi
        done
        echo
    done
fi

echo "Total sum of ASCII values: $total_sum"
