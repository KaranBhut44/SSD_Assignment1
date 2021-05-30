read word
results=$(compgen -c | grep -E "^[$word]+$")
input_word=$(grep -o . <<< $word | sort)
input_word=$(echo $input_word | sed 's/\n//')
flag=0
for i in $results
do
	original=$i
	option_word=$(grep -o . <<< $i | sort)
	option_word=$(echo $option_word | sed 's/\n//')
	if [[ "$option_word" == "$input_word" ]]
		then flag=1
		break
	fi
done
if test $flag = 1
then echo "Yes"
echo $original
else echo "No"
fi
