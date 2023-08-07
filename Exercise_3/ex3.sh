#!/bin/bash

array=(0 0 0 0 0 0 0 0 0 0)
string_number=("one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten")
result=""
flag=1
right_input=1
for arg in "$@";
do
	if [[ "$(($arg-1))" =~ ^[0-9]+$ ]]; then
		if [[ $arg -ge 1 && $arg -le 10 ]]; then
			((array[$(($arg-1))]++))
		else
			echo "Please enter numbers between 1 and 10."
			right_input=0
			break;
 		fi
 	else
    		echo "Input is not a valid number."
    		right_input=0
    		break;
	fi
done

if [ $right_input -eq 0 ];
then
	exit;
fi

for ((i = 0; i < ${#array[@]}; i++));
do
	if (("${array[$i]}" != 0)); then
		if [ "$flag" -eq 1 ]; then
			result+="${string_number[$i]} appeared ${array[$i]} times"
			flag=0
		else
			result+=", ${string_number[$i]} appeared ${array[$i]} times"
		fi		
		
	fi
done
echo -e $result
