values=$(tail -10 ${HOME}/.bash_history | cut -d " " -f 1)
var=$(echo "$values" | tr " " "\n" | sort | uniq -c | sort -bnr)
temp=0
count=0
for i in $var
do
if test $count = 0
	then temp=$i
else echo "$i $temp"
fi
if test $count = 0
then count=1
else count=0
fi
done





