#!/bin/bash

# Read each line from .notignore file
while IFS= read -r item; do
    # Check if the item exists and is not empty or a comment
    if [[ -n "$item" && ! "$item" =~ ^\s*# ]]; then
        # Add the item to Git staging area
        git add "$item"
    fi
done < dotfiles_list.txt
