# Question 1
##### a) created directory using `mkdir` command and cd into it by `cd` command.
##### b) made 5 files using `touch` command. `{}` is helpful to create multiple files in 1 line.
##### c) 
 - `find` command lists all file names whose name matches with `lab*.txt`(In this case it gives list `lab1.txt, lab2.txt, lab3.txt, lab4.txt and lab5.txt`).
 - Then it will take arguments(filenames) matches with structure defined and replace `.txt` with `.c`
##### d)
 - `-l` is used to display in long list format.
 - `-S` is used to sort content in Decreasing order of size.
 - `-r` is used to reverse the order of content

Hence, content is displayed in long list format sorted in increasing order of file size using `ls -lSr`.
##### e) `~` represents Home directory. `-maxdepth n` displays files and folders upto `n` depth.
##### f) Assumptions: 
 - I am still inside the Assignment1 directory which is created in `a)` task.
 - it don't contain the `.txt` files. because previously created `.txt` files  are already converted into `.c` files.
 - If we run this command seperatly inside any directory which contains `.txt` files. then It will show desired results.(Here it will show blank output) 

"\``pwd`\`" is used to display absolute path of result.
If we remove that and suppose `1.txt` is present in current directory, then it will display `./1.txt` where `.` represents current directory.

# Question 2
- I have used `compgen -c` command. which gives list of all executable commands.
- This list is given to `grep` for make list of commands which contains only letters of given word in input. So, total matching time will be less afterwards and stored in `results`.
- Input word is given to `grep -o . `which  gives all letters of given word (each character in newline). then it is sorted using `sort` command and stored in `input_word`.
- Now, characters are sorted but they are still in seperate lines. For that `sed` is used and replaced `\n` by `space` in `input_word`.
- then 1 by 1 command taken for matching from the   `results` then it is sorted by their characters and matched with `input_word` which contains already sorted input word.
- if they matches then original command from `results` is stored in `original` variable and loop is breaked using `break` statement and sets `flag` value to '1' (which was previously initialized as '0') 
- Atlast, if `flag` contains `1` then command name and `Yes` is displayed otherwise `No` is displayed.

# Question 3
##### Assumptions:
- It shows commands executed in previous terminal session. (Not in current session)

----> When the terminal is closed it's commands(with arguments, options etc) are stored inside `${HOME}/.bash_history` file. So, i have used that. took last 10 entries by `tail` command. Selected commands from whole entry using `cut` command.
----> For sorting using `sort` command, i divided them in seperate lines by replacing `space` with `\n` using `tr` command. then count number of occurences of each word using `uniq -c`. Then sorted in reverse order of their count values.
----> Still they are in below format.
Example: 5 cd
         2 history
         2 echo
         1 bash
-----> To show them in desired output format, i used `for` loop. And seperated count with commands by odd-even values of variable `count`. 
If `count is 0` then current `i` is count value. 
If `count is 1` then current `i` is command name.
-----> so, if `i` is `count value` then stored in `temp` variable. When command name comes(in next iteration) they are printed in desired format.

# Question 4
- I extracted `Alphanumeric` characters from input string.
- since `grep -o` gives each word in seperate line, i merged them by replacing `\n` with `space` by using `tr` command.
- Then truncated last space using `sed` command. and then displayed output in brackets by using `"(${ans[*]})"` command.

# Question 5
- Input word (`line`) is converted into lowercase by using `tr` command.
- Then that word is reversed by using `rev` command and stored into another variable called `line_rev`.
- Compared `line` and `line_rev` by using `test` command and they match then displayed `Yes` otherwise `No`.

# Question 6
 - Traversed in Argument array (`$@`) using `for` loop.
 - Stored 1st element in `res` variable. when 2nd element comes(In 2nd iteration), Exponentiation is performed between `res` and `current element`(2nd element of arguments array) and result is stored in `res` variable.
 - same operations are performed for all elements and the final value in `res` variable is result which is displayed atlast by `echo` command.

# Question 7
 - Took Process Information of running processes using `ps au` command.
 - process id is present in 2nd column of previous command's output. So, it is extracted using `tr` and `cut` command.
 - Deleted  1st entry which contains word `PID`(title) from previous output and stored process IDs into `pid.txt` file.
 - Took number from user and stored into variable `n`. Counted total number of lines present inside file `pid.txt` and stored it into variable `count`.
 - if `count` < `n` then made `n` = `count`.
 - Then displayed first `n` lines using `head` command from `pid.txt` file.

# Question 8
##### Format: `Min HR Dom Mon Dow Command`
----->Manual checking is very complex. `crontab` may contains @yearly, @monthly, etc followed by command name.
----->2 numbers can be present inside 1 field. (Ex:`Mon` may contain 4,6 ( means 4rth and 6th month))
----->It might contain range values (Ex:`Min` may contain 10-30 (means 10th to 30th minute))
----->It may contain multiple commands,etc
----->For simplification purpose, i used `crontab` command. 
----->It automatically checks all of these and some specific constraints to each fields.
      (Ex: `Min` must contains values between 0 and 59 (both inclusive)) 
 - Executed command `crontab $1`, where `$1` is commandline argument (which will be file name `crontab_file`).
 - Used `$?` which checks execution status of previously executed command.
   - If it is `0` then it means execution was successfull.
   - If it is non-zero then it means executon was unsuccessfull.
 - We don't care about error about `crontab $1` output(If it is successfull it gives nothing(null) if not then it throws error! Which we don't need).
 - To remove that error i redirected it to `/dev/null`.
 - We only need to know the status which can be known by `$?` command we used.
 - displayed `Valid` if `$? = 0` becomes true, otherwise displayed `Invalid`. 

# Question 9
 - I truncated spaces from input using `sed` command.
 - If input is `null` or has length `1` then input is invalid (As per the question). So, For both cases i printed `Invalid`. 
 - If input is `0` then it actually satisfies the constraints. because at the end `0 % 10 = 0`. So, we have to handle this case seperatly. Other all `length=1` digits
stays invalid in checking constraints. (Ex: `1 % 10 != 0`).So, no need to mention conditions seperatly for them.
 - Combined all characters in variable `st` by using `for` loop. Then checked if that string contains any non-numeric characters. If yes then printed `Invalid` by setting `flag` to `1`.
 - Then took digits `Right to Left` from string `st`, then make `count` value `0 to 1` or `1 to 0`.
   - If `count` is `0` (for last digit) then append that digit to variable `res` from left side.
   - If `count` is `1` then double that digit. If it result becomes `> 9` then subtract `9` from that and append to the left of variable `res`.
 - Then i found sum of all digits of `res`. If sum is divisible by 10 then print `Valid` otherwise print `Invalid`.

# Question 10
 - Read operator into variable `S`. Set value of `type1` variable's value according to operator type.
 - then took value `n` from input. which is number of operands.
 - Stored 1st operand in `temp`.Then from 2nd iteration onwards, Took operand value performed operation with `temp` and stored result into `temp`.
 - `re` contains regular expression for `non-integers`.If result (final `temp` value) matches with `re`(If `temp` contains float value) then print result with 4 decimals after `.` otherwise print Integer result as it is(`temp` value).
