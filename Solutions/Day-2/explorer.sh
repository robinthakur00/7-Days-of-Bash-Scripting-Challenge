#!/bin/bash

# Part 1: File and Directory Exploration
echo "Welcome to the Interactive File and Directory Explorer"
while true; do
    echo -e "\nFiles and Directories in the Current Path:"
    # List Files and Directories in the Current Path
    ls -lh
# Part 2: Character Counting
    read -p "Enter a line of text (Press Enter without text to exit): " input
    if [ -z "$input" ]; then
        echo "Exiting the Interactive Explorer. Goodbye!"
        break
    fi

# Count characters and display the count
    char_count=${#input}
    echo "Character Count: $char_count"
done    