mkdir Assignment1
cd Assignment1
touch lab{1,2,3,4,5}.txt
find . -name 'lab*.txt' -exec bash -c ' mv $0 ${0/.txt/.c}' {} \;
ls -lSr
find ~ -maxdepth 2
find "`pwd`" -name "*.txt"

