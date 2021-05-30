ps au | tr -s " " | cut -d " " -f 2 | sed '1d' > pid.txt
read N
count=$(wc -l pid.txt | cut -d " " -f 1)
if (( $count < $N ))
then N=$count 
fi
printf "$(head -$N pid.txt)\n"
