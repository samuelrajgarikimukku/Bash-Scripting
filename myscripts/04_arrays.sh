#!/bin/bas

myArray=(1 20 30.5 Hello "Hey Buddy!")

echo "value in 3rd index ${myArray[3]}"
echo "${myArray[@]}"
echo "Length of this array is ${#myArray[*]}"
echo "values from index  2-3 ${myArray[*]:2:2}"

#updating our array with new values
myArray+=(new 30 40)

echo "values of array after updating are ${myArray[*]}"

