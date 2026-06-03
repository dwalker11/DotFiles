function rename_old --description "Rename a file by appending .old extension"
    # Check if argument is provided
    if test (count $argv) -eq 0
        echo "Usage: rename_old <filename>"
        echo "Renames the specified file by appending '.old' to its name"
        return 1
    end
    
    set file $argv[1]
    
    # Check if file exists
    if not test -e "$file"
        echo "Error: File '$file' does not exist"
        return 1
    end
    
    # Check if target file already exists
    set new_name "$file.old"
    if test -e "$new_name"
        echo "Error: Target file '$new_name' already exists"
        return 1
    end
    
    # Rename the file
    if mv "$file" "$new_name"
        echo "Successfully renamed '$file' to '$new_name'"
    else
        echo "Error: Failed to rename '$file'"
        return 1
    end
end
