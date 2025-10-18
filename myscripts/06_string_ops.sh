#!/bin/bash

myVar="Hey Buddy, How are you?"

myvarLength=${#myVar}
echo "Length of my var is $myvarLength"

#upper case
echo "Upper Case is----------${myVar^^}"

#Lower Case
echo "Lower Case is---------${myVar,,}"

#Replacing the string
newVar=${myVar/Buddy/Sam}
echo "New Var is----------$newVar}"

#Slicing 
echo "After slice ${myVar:4:5}"

