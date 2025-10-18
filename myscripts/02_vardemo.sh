#!/bin/bash

#Script to show how to use varaiables

a=10
names="Samuel"
age=29

echo "My name is $names and age is $age"

names="paul"
echo "My name is $names and age is $age"


# variable to store the output of the command

HOSTNAME=$(hostname)
echo "Name of the host is $HOSTNAME"

