#!/bin/bash

# Function to generate a random number between 1 and 100
generate_random_number() {
  echo $((1 + RANDOM % 100))
}

# Generate random matrix size (up to 10 rows and columns)
rows=$((1 + RANDOM % 10))
columns=$((1 + RANDOM % 10))

# Initialize an associative array to represent the matrix
declare -A matrix

# Fill the matrix with random numbers
for ((i = 1; i <= rows; i++)); do
  for ((j = 1; j <= columns; j++)); do
    matrix["$i,$j"]=$(generate_random_number)
  done
done

# Print the matrix
for ((i = 1; i <= rows; i++)); do
  for ((j = 1; j <= columns; j++)); do
    printf "%3d " ${matrix["$i,$j"]}
  done
  echo
done

