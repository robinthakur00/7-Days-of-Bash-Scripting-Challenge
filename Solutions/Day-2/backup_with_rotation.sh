#!/bin/bash

perform_backup_with_rotation() {
    # Check if the directory path is provided as an argument
    if [ -z "$1" ]; then
        echo "Error: Directory path is missing."
        return 1
    fi

    local source_directory="$1"
    local backup_directory="${source_directory}/backup_$(date +'%Y-%m-%d_%H-%M-%S')"

    # Create a backup folder with timestamp
    mkdir -p "$backup_directory"
    
    # Copy files from source directory to backup directory
    cp -r "${source_directory}"/* "$backup_directory"

    # Get the number of existing backup folders
    local num_backups=$(ls -d "${source_directory}"/backup_* 2>/dev/null | wc -l)
    local num_to_keep=3

    # Remove oldest backups if the number of backups is greater than the limit
    if [ "$num_backups" -gt "$num_to_keep" ]; then
        # Calculate the number of backups to remove
        local num_to_remove=$((num_backups - num_to_keep))
        
        # List backup folders sorted by modification time, and remove the oldest ones
        ls -dt "${source_directory}"/backup_* | tail -n "$num_to_remove" | xargs rm -rf
    fi

    echo "Backup created: $backup_directory"
}

# Check if a directory path is provided as a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Call the function with the provided directory path
perform_backup_with_rotation "$1"
