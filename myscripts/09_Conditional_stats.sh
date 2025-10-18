read -p "Enter your Marks: " marks

if [[ $marks -gt 40 ]]
then
	echo "You are PASS"
else
	echo "You are FAIL!!!!"
fi
