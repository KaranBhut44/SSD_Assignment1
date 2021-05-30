read S
if test "$S" = "+"
then type1="add"
elif test "$S" = "*"
then type1="mul"
elif test "$S" = "-"
then type1="sub"
elif test "$S" = "/"
then type1="div"
fi
read n
count=0
temp=0
for ((i = 1 ; i <= n ; i++))
do
	read a
	if test $count = 0
		then temp=$a
	else
		{
		if test $type1 = "mul"
		then let "temp=$temp * $a"
		elif test $type1 = "add"
		then let "temp=$temp + $a"
		elif test $type1 = "sub"
		then let "temp=$temp - $a"
		elif test $type1 = "div"
		then temp=$(bc -l <<< "($temp / $a)")
		fi
		} 
	fi
	let count=$count+1
done
re='^[-*][0-9]+$'

if ! [[ $temp =~ $re ]] ; then
	printf "%.4f\n" $temp
else
	echo $temp
fi


