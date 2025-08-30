#!/bin/sh
set -e
cd "$(dirname "$0")"
pandocx -o new-exported-filename.docx

# Check the return status of the last command
if [ $? -eq 0 ]; then
  echo "Script executed successfully, closing the terminal window..."
  osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' & exit 0
else
  echo "Script execution failed, please check the error messages."
  read -p "Press any key to continue..."
  exit 1
fi