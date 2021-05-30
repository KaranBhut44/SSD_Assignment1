read -r line
ans=$(echo -n $line | grep -Eo '[+-]?[a-zA-Z0-9]+([.][0-9]+)?+' | tr "\n" " " | sed 's/ *$//g')
echo "(${ans[*]})"

