#!/bin/bash

# Task 1: Comments

# Task 2: Echo
echo "Bash Scripting"

# Task 3: Variables
echo "Variables......"
var1="Hello"
var2="World"
echo $var1 $var2

# Task 4: Use of Variables
echo "Use of Variables......"
echo "Enter the first number:"
read num1
echo "Enter the second number:"
read num2
sum=$(($num1 + $num2))
echo "The sum of $num1 and $num2 is: $sum"

# Task  5: Using Built-in Variables
echo "Using Built-in Variables......"
echo "Current Path of Bash - $BASH"
echo "Bash Version - $BASH_VERSION"
echo "Home Directory - $HOME"
echo "Present Working Directory - $PWD"
echo "Hostname - $HOSTNAME"
echo "Process ID of the script: $$"

#Task 6: Wildcards
echo "Wildcards......"
echo "List of all .txt files in the current directory:"
ls *.txt