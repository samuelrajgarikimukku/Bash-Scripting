#!/bin/bash

# to axxess arguments 

echo "First arguments is $1"
echo "Second arguments is $2"

echo "All the arguments are $@"
echo "All the arguments are $#"


# For loop to access the values from arguments 

for filename in $@
do
	echo "Copying file -$filename"
done




