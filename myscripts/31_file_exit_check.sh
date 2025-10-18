FILEPATH="/mnt/c/Users/samue/Documents/myscripts/test.csv"

if [[ -f $FILEPATH ]]
then
	    echo "File exist"
    else
	        echo "File not exist"
		    exit 1
fi
