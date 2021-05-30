crontab $1 2> /dev/null
if test $? = 0
then echo "Valid"
else echo "Invalid"
fi

