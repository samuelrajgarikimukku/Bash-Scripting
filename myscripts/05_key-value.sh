#!/bin/bash

declare -A myArray

myArray=(
	[name]="Prashant"
	[age]="28"
	[city]="Paris"
)

# Access valus by key
echo "Name: ${myArray[name]}"
echo "Age: ${myArray[age]}"
echo "City: ${myArray[city]}"

#Print all keys
echo "All Keys: ${!myArray[*]}"

#Print all values
echo  "All Values: ${myArray[*]}"

#Length of associated array
echo "Number of elements: ${#myArray[*]}"


