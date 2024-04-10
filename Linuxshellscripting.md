PROJECT: BASH SCRIPT FOR GENERATING A MULTIPLICATION TABLE
1.	For this project on using bash scripting for generating a multiplication table, I would be using my ubuntu terminal and vim text editor to write my scripts. 
2.	Creation of Bash Script File for my project: first, I opened my Ubuntu terminal and created a directory called Linux-shell-script, using the command mkdir Linux-shell-script. I used ls to confirm that the directory has been created. Afterwards, I change directory to Linux-shell-script using the command cd Linux-shell-script. See below the feedback;
sojy@OlasojiUbuntu:~$ mkdir Linux-shell-script
sojy@OlasojiUbuntu:~$ ls
control_flow.sh  exerice.txt  Linux-shell-script    Pictures         snap
Desktop          file1        MarketPeak_Ecommerce  Public           Templates
Documents        file2        Music                 shellscript2.sh  Videos
Downloads        file3        nano_project.txt      shell-scripting
sojy@OlasojiUbuntu:~$ cd Linux-shell-script/
sojy@OlasojiUbuntu:~/Linux-shell-script$
3.	I created a bash script file in the directory using vim generate_multiplication_table.sh.
4.	Write my script header: I begin my script writing in vim text-editor with shebang #!/bin/bash meaning that the bash interpreter should execute the script written.
5.	I inserted a comment beginning with # symbol; “# Ask the user to enter a number. This comment help to provide clear explanation to what is being done in scripting. 
6.	“read -p "Enter a number: " number” this is the read user for desired input command that will allow the variable to be chosen. 
7.	I also used another comment “# Check if the input is a positive number” to explain the next command of validating the user input.
I introduced a conditional logic to check and confirm if the variable presented is a number, then fine and if not it will give error. A conditional statement involves, if, !, $, then else, and echo. Conditional statement always ends with fi. I used the command: 
“if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a positive integer."
    exit 1
fi
8.	Ask user for the table type, whether full table or partial multiplication table within a given range; I used another comment “# ask the user to choose between full or partial multiplication table. Then, I used another user input with read command; “read -p "Do you want to see a full multiplication table from 1 to 10 (f) or a partial table within a specified range (p)? [f/p]: " choice. This will provide the user the choice of full or partial multiplication table selection.

9.	Table generation functions: here, I used two comments, one for the full multiplication table generation and the other for partial table generation;

“# Function to generate full multiplication table
generate_full_table() {
    echo "Multiplication table for $number (1 to 10):"
    for ((i=1; i<=10; i++)); do
        result=$((number * i))
        echo "$number x $i = $result"
    done
}

# Function to generate partial multiplication table within a specified range
generate_partial_table() {
    read -p "Enter the starting range: " start
    read -p "Enter the ending range: " end. 
From the command above, user input was inserted for partial multiplication generation to ensure range start and end, as desired by the user. The above command talks about two functions, full and partial multiplication. Using loop, it calculates the result of the number used as variable. The given number is 1-10. For the partial table, it prompts for start number and end number within the range.
10.	For the full multiplication table generation, I used C-type for loop to print result when it iterates from 1-10. A loop was also used for the function of partial multiplication table generation with start and end ranges.
11.	Process invalid input; when invalid option is used respond with error message. Also, allow user to make choice of whether full table or partial table using start and end numbers.
My full script before testing:
 #!/bin/bash

# Ask the user to enter a number
read -p "Enter a number: " number

# Check if the input is a positive number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a positive integer."
    exit 1
fi

# Ask the user to choose between full or partial multiplication table
read -p "Do you want to see a full multiplication table from 1 to 10 (f) or a partial table within a specified range (p)? [f/p]: " choice

# Function to generate full multiplication table
generate_full_table() {
    echo "Multiplication table for $number (1 to 10):"
    for ((i=1; i<=10; i++)); do
        result=$((number * i))
        echo "$number x $i = $result"
    done
}

# Function to generate partial multiplication table within a specified range
generate_partial_table() {
    read -p "Enter the starting range: " start
    read -p "Enter the ending range: " end

    # Check if start and end are positive integers
    if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter positive integers for the range."
        exit 1
    fi

    echo "Partial multiplication table for $number ($start to $end):"
    for ((i=start; i<=end; i++)); do
        result=$((number * i))
        echo "$number x $i = $result"
    done
}

# Conditional logic based on user choice
case $choice in
    f|F)
        generate_full_table
        ;;
    p|P)
        generate_partial_table
        ;;
    *)
        echo "Invalid choice. Please enter 'f' for full table or 'p' for partial table."
        exit 1
        ;;
esac
12.	After updating my script in vim text-editor, I granted permission to my shell scripting file to enable me execute. I used the command “ chmod +x generate_multiplication_table.sh
13.	I tested my script with the command “./generate_multiplication_table.sh”
sojy@OlasojiUbuntu:~$ ls
control_flow.sh  exerice.txt  Linux-shell-script    Pictures         snap
Desktop          file1        MarketPeak_Ecommerce  Public           Templates
Documents        file2        Music                 shellscript2.sh  Videos
Downloads        file3        nano_project.txt      shell-scripting
sojy@OlasojiUbuntu:~$ cd Linux-shell-script
sojy@OlasojiUbuntu:~/Linux-shell-script$ ls
generate_multiplication_table.sh
sojy@OlasojiUbuntu:~/Linux-shell-script$ vim generate_multiplication_table.sh
sojy@OlasojiUbuntu:~/Linux-shell-script$ vim generate_multiplication_table.sh
sojy@OlasojiUbuntu:~/Linux-shell-script$ ls -latr
total 12
-rw-rw-r--  1 sojy sojy 1559 Apr 10 03:30 generate_multiplication_table.sh
drwxr-x--- 20 sojy sojy 4096 Apr 10 03:30 ..
drwxrwxr-x  2 sojy sojy 4096 Apr 10 03:30 .
sojy@OlasojiUbuntu:~/Linux-shell-script$ chmod +x generate_multiplication_table.sh
sojy@OlasojiUbuntu:~/Linux-shell-script$ ls -latr
total 12
-rwxrwxr-x  1 sojy sojy 1559 Apr 10 03:30 generate_multiplication_table.sh
drwxr-x--- 20 sojy sojy 4096 Apr 10 03:30 ..
drwxrwxr-x  2 sojy sojy 4096 Apr 10 03:30 .
sojy@OlasojiUbuntu:~/Linux-shell-script$ 
14.	When I tested the script with the command; ./generate_multiplication_table.sh. see below my response for a full multiplication table generation;
sojy@OlasojiUbuntu:~/Linux-shell-script$ ./generate_multiplication_table.sh
Enter a number: 7
Do you want to see a full multiplication table from 1 to 10 (f) or a partial table within a specified range (p)? [f/p]: f
Multiplication table for 7 (1 to 10):
7 x 1 = 7
7 x 2 = 14
7 x 3 = 21
7 x 4 = 28
7 x 5 = 35
7 x 6 = 42
7 x 7 = 49
7 x 8 = 56
7 x 9 = 63
7 x 10 = 70
sojy@OlasojiUbuntu:~/Linux-shell-script$ 
15.	I run another execution on the script for the same number 7 but for partial multiplication table. See response obtained;
sojy@OlasojiUbuntu:~/Linux-shell-script$ ./generate_multiplication_table.sh
Enter a number: 7
Do you want to see a full multiplication table from 1 to 10 (f) or a partial table within a specified range (p)? [f/p]: p
Enter the starting range: 3
Enter the ending range: 9
Partial multiplication table for 7 (3 to 9):
7 x 3 = 21
7 x 4 = 28
7 x 5 = 35
7 x 6 = 42
7 x 7 = 49
7 x 8 = 56
7 x 9 = 63
sojy@OlasojiUbuntu:~/Linux-shell-script$ 
16.	I tried using an alphabet and then a negative integer and got error message below;
sojy@OlasojiUbuntu:~/Linux-shell-script$ ./generate_multiplication_table.sh
Enter a number: p
Error: Please enter a positive integer.
sojy@OlasojiUbuntu:~/Linux-shell-script$ ./generate_multiplication_table.sh
Enter a number: -6
Error: Please enter a positive integer.
sojy@OlasojiUbuntu:~/Linux-shell-script$ 
17.	I enhanced the user interaction by inserting user input that allow for repeating this exercise without restarting the scripting with ./filename. This I did by looping the script. I also enhanced the multiplication table to reach 12 instead of 10;


#!/bin/bash

while true; do
    # Ask the user to enter a number
    read -p "Enter a number: " number

    # Check if the input is a positive number
    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a positive integer."
        continue
    fi

    # Ask the user to choose between full or partial multiplication table
    read -p "Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: " choice

    # Function to generate full multiplication table
    generate_full_table() {
        echo "Multiplication table for $number (1 to 10):"
        for ((i=1; i<=12; i++)); do
            result=$((number * i))
            echo "$number x $i = $result"
        done
    }

    # Function to generate partial multiplication table within a specified range
    generate_partial_table() {
        read -p "Enter the starting range: " start
        read -p "Enter the ending range: " end

        # Check if start and end are positive integers
        if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
            echo "Error: Please enter positive integers for the range."
            return
        fi

        echo "Partial multiplication table for $number ($start to $end):"
        for ((i=start; i<=end; i++)); do
            result=$((number * i))
            echo "$number x $i = $result"
        done
    }

    # Conditional logic based on user choice
    case $choice in
        f|F)
            generate_full_table
            ;;
        p|P)
            generate_partial_table
            ;;
        *)
            echo "Invalid choice. Please enter 'f' for full table or 'p' for partial table."
            continue
            ;;
    esac

    # Ask the user if they want to repeat the program
    read -p "Do you want to repeat for another number? (y/n): " repeat
    if [ "$repeat" != "y" ]; then
        break
    fi
done
18.	See the output after I executed this script.;

sojy@OlasojiUbuntu:~/Linux-shell-script$ vim generate_multiplication_table.sh
sojy@OlasojiUbuntu:~/Linux-shell-script$ ./generate_multiplication_table.sh
Enter a number: 6
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: f
Multiplication table for 6 (1 to 10):
6 x 1 = 6
6 x 2 = 12
6 x 3 = 18
6 x 4 = 24
6 x 5 = 30
6 x 6 = 36
6 x 7 = 42
6 x 8 = 48
6 x 9 = 54
6 x 10 = 60
6 x 11 = 66
6 x 12 = 72
Do you want to repeat for another number? (y/n): y
Enter a number: 8
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: f
Multiplication table for 8 (1 to 10):
8 x 1 = 8
8 x 2 = 16
8 x 3 = 24
8 x 4 = 32
8 x 5 = 40
8 x 6 = 48
8 x 7 = 56
8 x 8 = 64
8 x 9 = 72
8 x 10 = 80
8 x 11 = 88
8 x 12 = 96
Do you want to repeat for another number? (y/n): y
Enter a number: 3
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: p
Enter the starting range: 2
Enter the ending range: 8
Partial multiplication table for 3 (2 to 8):
3 x 2 = 6
3 x 3 = 9
3 x 4 = 12
3 x 5 = 15
3 x 6 = 18
3 x 7 = 21
3 x 8 = 24
Enter a number: 4
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: p
Enter the starting range: 2
Enter the ending range: 7
Partial multiplication table for 4 (2 to 7):
4 x 2 = 8
4 x 3 = 12
4 x 4 = 16
4 x 5 = 20
4 x 6 = 24
4 x 7 = 28
Do you want to repeat for another number? (y/n): y
Enter a number: 9
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: f
Multiplication table for 9 (1 to 10):
9 x 1 = 9
9 x 2 = 18
9 x 3 = 27
9 x 4 = 36
9 x 5 = 45
9 x 6 = 54
9 x 7 = 63
9 x 8 = 72
9 x 9 = 81
9 x 10 = 90
9 x 11 = 99
9 x 12 = 108
19.	I added the option for the user to choose whether the multiplication table be displayed in ascending or descending order. See the script modification and corresponding responses;

#!/bin/bash

while true; do
    # Ask the user to enter a number
    read -p "Enter a number: " number

    # Check if the input is a positive number
    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a positive integer."
        continue
    fi

    # Ask the user to choose between full or partial multiplication table
    read -p "Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: " choice

    # Function to generate full multiplication table
    generate_full_table() {
        local order=$1
        echo "Multiplication table for $number (1 to 12):"
        if [ "$order" == "ascending" ]; then
            for ((i=1; i<=12; i++)); do
                result=$((number * i))
                echo "$number x $i = $result"
            done
        elif [ "$order" == "descending" ]; then
            for ((i=12; i>=1; i--)); do
                result=$((number * i))
                echo "$number x $i = $result"
            done
        fi
    }

    # Function to generate partial multiplication table within a specified range
    generate_partial_table() {
        read -p "Enter the starting range: " start
        read -p "Enter the ending range: " end

        # Check if start and end are positive integers
        if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
            echo "Error: Please enter positive integers for the range."
            return
        fi

        read -p "Do you want the table in ascending or descending order? [ascending/descending]: " order

        echo "Partial multiplication table for $number ($start to $end):"
        if [ "$order" == "ascending" ]; then
            for ((i=start; i<=end; i++)); do
                result=$((number * i))
                echo "$number x $i = $result"
            done
        elif [ "$order" == "descending" ]; then
            for ((i=end; i>=start; i--)); do
                result=$((number * i))
                echo "$number x $i = $result"
            done
        fi
    }

    # Conditional logic based on user choice
    case $choice in
        f|F)
            read -p "Do you want the table in ascending or descending order? [ascending/descending]: " order
            generate_full_table "$order"
            ;;
        p|P)
            generate_partial_table
            ;;
        *)
            echo "Invalid choice. Please enter 'f' for full table or 'p' for partial table."
            continue
            ;;
    esac

    # Ask the user if they want to repeat the program
    read -p "Do you want to repeat for another number? (y/n): " repeat
    if [ "$repeat" != "y" ]; then
        break
    fi
done
the output;

Do you want to repeat for another number? (y/n): n
sojy@OlasojiUbuntu:~/Linux-shell-script$ vim generate_multiplication_table.sh
sojy@OlasojiUbuntu:~/Linux-shell-script$ ./generate_multiplication_table.sh
Enter a number: 2
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: f
Do you want the table in ascending or descending order? [ascending/descending]: descending
Multiplication table for 2 (1 to 12):
2 x 12 = 24
2 x 11 = 22
2 x 10 = 20
2 x 9 = 18
2 x 8 = 16
2 x 7 = 14
2 x 6 = 12
2 x 5 = 10
2 x 4 = 8
2 x 3 = 6
2 x 2 = 4
2 x 1 = 2
Do you want to repeat for another number? (y/n): y
Enter a number: 3
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: f
Do you want the table in ascending or descending order? [ascending/descending]: ascending
Multiplication table for 3 (1 to 12):
3 x 1 = 3
3 x 2 = 6
3 x 3 = 9
3 x 4 = 12
3 x 5 = 15
3 x 6 = 18
3 x 7 = 21
3 x 8 = 24
3 x 9 = 27
3 x 10 = 30
3 x 11 = 33
3 x 12 = 36
Do you want to repeat for another number? (y/n): y
Enter a number: 4
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: f
Do you want the table in ascending or descending order? [ascending/descending]: descending
Multiplication table for 4 (1 to 12):
4 x 12 = 48
4 x 11 = 44
4 x 10 = 40
4 x 9 = 36
4 x 8 = 32
4 x 7 = 28
4 x 6 = 24
4 x 5 = 20
4 x 4 = 16
4 x 3 = 12
4 x 2 = 8
4 x 1 = 4
Do you want to repeat for another number? (y/n): y
Enter a number: 5
Do you want to see a full multiplication table from 1 to 12 (f) or a partial table within a specified range (p)? [f/p]: p
Enter the starting range: 3
Enter the ending range: 9
Do you want the table in ascending or descending order? [ascending/descending]: ascending
Partial multiplication table for 5 (3 to 9):
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
Do you want to repeat for another number? (y/n): n
20.	Finally, I used n (no) to end the programme. It was fun, learning to use varaiblesto store user inputs, loop to automate repetitive tasks, conditional statements to grant options to users, comments to describe and explain what those codes are meant to execute. Read user input that allow codes respond to user .






