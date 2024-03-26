I learnt shell scripting using control flow (if, elif, else and fi). I also learnt read user input (read -p). I learnt to use operators such as -gt, -lt,-eq, -ne. Lastly, I learnt loops. i understand that loops helps to automate and repeat tasks without writing the same code every time the task is to be executed. I practicalized the use of For loop, the list form with syntax for, in, do and done. considering a set variable (i). I also, practiced the C-style form of for-loop. See below what I did on my ubuntu terminal;
1st task
 sojy@OlasojiUbuntu:~$ ls
Desktop      file1  nano_project.txt  shell-scripting
Documents    file2  Pictures          snap
Downloads    file3  Public            Templates
exerice.txt  Music  shellscript2.sh   Videos
sojy@OlasojiUbuntu:~$ touch control_flow.sh
sojy@OlasojiUbuntu:~$ ls
control_flow.sh  exerice.txt  Music             shellscript2.sh  Videos
Desktop          file1        nano_project.txt  shell-scripting
Documents        file2        Pictures          snap
Downloads        file3        Public            Templates
sojy@OlasojiUbuntu:~$ vim control_flow.sh
sojy@OlasojiUbuntu:~$ ./control_flow.sh
bash: ./control_flow.sh: Permission denied
sojy@OlasojiUbuntu:~$ ls -latr control_flow.sh
-rw-rw-r-- 1 sojy sojy 46 Mar 26 00:45 control_flow.sh
sojy@OlasojiUbuntu:~$ chmod +x control_flow.sh
sojy@OlasojiUbuntu:~$ ./control_flow.sh
Enter a number: 9
sojy@OlasojiUbuntu:~$ vim control_flow.sh
sojy@OlasojiUbuntu:~$ ./control_flow.sh
Enter a number: 9
You have entered the number 9
the number is positive.
sojy@OlasojiUbuntu:~$ vim control_flow.sh
sojy@OlasojiUbuntu:~$ vim control_flow.sh
sojy@OlasojiUbuntu:~$ ./control_flow.sh
Enter a number: 5
You have entered the number 5
the number is positive.
sojy@OlasojiUbuntu:~$ 

2nd task
sojy@OlasojiUbuntu:~$ ls
control_flow.sh  exerice.txt  Music             shellscript2.sh  Videos
Desktop          file1        nano_project.txt  shell-scripting
Documents        file2        Pictures          snap
Downloads        file3        Public            Templates
sojy@OlasojiUbuntu:~$ cd shell-scripting/
sojy@OlasojiUbuntu:~/shell-scripting$ ls
Folder1  Folder2  Folder3  my_first_shell_script.sh
sojy@OlasojiUbuntu:~/shell-scripting$ vim control_flow.sh
sojy@OlasojiUbuntu:~/shell-scripting$ ./control_flow.sh
bash: ./control_flow.sh: Permission denied
sojy@OlasojiUbuntu:~/shell-scripting$ ls -latr control_flow.sh
-rw-rw-r-- 1 sojy sojy 53 Mar 26 01:46 control_flow.sh
sojy@OlasojiUbuntu:~/shell-scripting$ chmod +x control_flow.sh
sojy@OlasojiUbuntu:~/shell-scripting$ ls -latr control_flow.sh
-rwxrwxr-x 1 sojy sojy 53 Mar 26 01:46 control_flow.sh
sojy@OlasojiUbuntu:~/shell-scripting$ ./control_flow.sh
1
2
3
4
5
sojy@OlasojiUbuntu:~/shell-scripting$ vim control_flow.sh
sojy@OlasojiUbuntu:~/shell-scripting$ ./control_flow.sh
1
2
3
4
5
6
7
8
9
10
sojy@OlasojiUbuntu:~/shell-scripting$ vim control_flow.sh
sojy@OlasojiUbuntu:~/shell-scripting$ ./control_flow.sh
1
2
3
4
sojy@OlasojiUbuntu:~/shell-scripting$
For the 2nd task using for-loop see my script in vi text-editor;
1.
#!/bin/bash
# for loops
for i in 1 2 3 4 5
do
echo $i
done
2.
#!/bin/bash
#for loops
for i in {1..10}
do
echo $i
done

C-style form;
for (( i-0; i<5; i++ ))
do 
echo $i
done.