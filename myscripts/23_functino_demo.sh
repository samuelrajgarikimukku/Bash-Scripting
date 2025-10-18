#!/bin/bash

function welcomeNote {
	echo "--------------"
	echo "Welcome"
	echo "--------------"
}

welcomeNote
welcomeNote
welcomeNote
welcomeNote

echo "Methods 2"

welcomeNote() {
	echo "-----------"
	echo "Welocme"
	echo "-----------"
}
welcomeNote
welcomeNote

