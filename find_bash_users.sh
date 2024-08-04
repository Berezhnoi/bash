#!/bin/bash

# Script to find all users with /bin/bash as their shell
# Usage:
#   ./find_bash_users.sh
#     - Saves the list of users with /bin/bash as their shell to 'bash_users.txt' by default.
#   ./find_bash_users.sh screen
#     - Displays the list of users with /bin/bash as their shell on the screen.
# 
# Note:
#   If an invalid argument is provided, the script will still save the output to 'bash_users.txt'.

# Define the default output file
DEFAULT_OUTPUT_FILE="bash_users.txt"

# Check if the /etc/passwd file exists
if [ ! -f /etc/passwd ]; then
  echo "/etc/passwd file not found!"
  exit 1
fi

# Extract users with /bin/bash shell
RESULT=$(grep '/bin/bash' /etc/passwd | cut -d: -f1)

# Determine the output type
if [ "$#" -eq 0 ]; then
  # No arguments provided, save results to the default file
  echo "$RESULT" > "$DEFAULT_OUTPUT_FILE"
  echo "Users with /bin/bash shell have been saved to $DEFAULT_OUTPUT_FILE"
elif [ "$1" = "screen" ]; then
  # Argument is 'screen', display results on the screen
  echo "$RESULT"
else
  # Invalid argument, save results to the default file
  echo "$RESULT" > "$DEFAULT_OUTPUT_FILE"
  echo "Invalid argument: $1"
  echo "Saved the results to $DEFAULT_OUTPUT_FILE"
fi
