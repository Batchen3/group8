#!/bin/bash

declare -A matrix
num_rows=$(cat /etc/passwd | wc -l)
num_columns=7

# set the matrix
i=1;
while IFS=':' read -r -a array_of_details; do
	for ((j=1; j<=num_columns; j++)) do
		matrix[$i,$j]=${array_of_details[(($j-1))]}
	done
	((i++))
done < /etc/passwd

# print the matrix 
for ((i=1; i<=num_rows; i++)); do
	for ((j=1; j<=num_columns; j++)); do
    		printf "%-15s " "${matrix["$i,$j"]}"
 	done
  	echo
done
