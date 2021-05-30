read line
line_lower=$(echo $line | tr "[A-Z]" "[a-z]")
line_rev=$(echo $line_lower | rev)
if test $line_lower =  $line_rev
then echo "Yes"
else echo "No"
fi

