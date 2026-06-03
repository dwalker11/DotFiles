function leetcode_py
    function leetcode_py --description "Create a Python file in Code/Leetcode directory from a text string"
        # Check if argument is provided
        if test (count $argv) -eq 0
            echo "Usage: leetcode_py <text string>"
            echo "Creates a Python file in ~/Code/Leetcode/ with filename based on the text string"
            echo "Example: leetcode_py 'two sum problem' -> creates two_sum_problem.py"
            return 1
        end

        # Join all arguments into a single string
        set text_string (string join " " $argv)

        # Convert to lowercase and replace spaces/dashes with underscores
        set filename (string lower $text_string | string replace -a " " "_" | string replace -a "-" "_")

        # Remove any characters that aren't alphanumeric, underscore, or hyphen
        set filename (string replace -ra '[^a-z0-9_]' '' $filename)

        # Ensure filename doesn't start with a number (invalid Python module name)
        if string match -qr '^[0-9]' $filename
            set filename "problem_$filename"
        end

        # Add .py extension
        set filename "$filename.py"

        # Set the target directory
        set target_dir "$HOME/Code/Leetcode"
        set full_path "$target_dir/$filename"

        # Check if Code/Leetcode directory exists, create if it doesn't
        if not test -d "$target_dir"
            echo "Creating directory: $target_dir"
            mkdir -p "$target_dir"
        end

        # Check if file already exists
        if test -e "$full_path"
            echo "Error: File '$filename' already exists in $target_dir"
            return 1
        end

        # Create the Python file with basic template
        cat >"$full_path" < < EOF
        """
TODO: Add problem description here
"""

        def solution():
        """
    TODO: Implement solution
    """
        pass

        def main():
        # Test cases
        pass

        if __name__ == "__main__":
            main()
            EOF

            echo "Successfully created: $full_path"
            echo "Filename: $filename"
        end
    end
