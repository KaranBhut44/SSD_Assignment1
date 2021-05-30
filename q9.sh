read line
l1=$(echo $line | sed 's/ //g')
if [ -z "$line" ]
then echo "Invalid"
elif test $l1 = 0
then echo "Invalid"
else
{
flag=0
st=""
for i in $line
do
st="$st$i"
done
[[ $st =~ ^[0-9]+$ ]] && flag=1
if test $flag = 0
then echo "Invalid"
else
{
	count=0
	res=""
	while [ $st -gt 0 ]
	do
		k=$(( $st % 10 ))
		st=$(( $st / 10 ))
		if test $count = 0
		then res="$k$res"
		else
		{
			k=$(( $k * 2 ))
			if [ $k -gt 9 ]
			then k=`expr $k - 9`
			fi
			res="$k$res"
		}
		fi
		if test $count = 0
			then count=1
			else count=0
		fi
	done
	sum=0
	if [ -z $res ]
	then echo "Valid"
	else
	while [ $res -gt 0 ]
	do
		k1=$(( $res % 10 ))
		res=$(( $res / 10 ))
		sum=$(( $sum + $k1 ))
	done
	mod=$(( $sum % 10 ))
	if test $mod = 0
	then echo "Valid"
	else echo "Invalid"
	fi
	fi
}
fi
}
fi
