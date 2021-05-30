count=0
for i in $@
do
	if test $count = 0
		then res=$i
	else
	let "res=$res**$i"
	fi
let "count=$count+1"
done
echo $res
