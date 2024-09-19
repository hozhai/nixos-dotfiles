#!/usr/bin/env bash

# Constants for colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

# ASCII Art for title
ART="
░█▀█░▀█▀░█░█░█▀█░█▀▀░░░█▀▄░█▀▀░█▀▄░█░█░▀█▀░█░░░█▀▄
░█░█░░█░░▄▀▄░█░█░▀▀█░░░█▀▄░█▀▀░█▀▄░█░█░░█░░█░░░█░█
░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀▀▀░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀▀░
"

# Display the title with colors
echo -e "${BLUE}${ART}${RESET}"
echo -e "${YELLOW}Starting NixOS rebuild...${RESET}"

# Construct the command
COMMAND="sudo nixos-rebuild switch --flake /home/zhai/.config/nixos/#nixos $*"

# Print the command being run
echo -e "${BLUE}Running command:${RESET} $COMMAND"
echo -e "${YELLOW}---------------------------------------------------${RESET}"

# Execute the command and print the output directly to stdout
bash -c "$COMMAND" 2>&1

# Capture the exit status
EXIT_STATUS=$?

# Announce success or failure
if [ $EXIT_STATUS -eq 0 ]; then
  echo -e "${GREEN}Rebuild successful!${RESET}"
else
  echo -e "${RED}Rebuild failed with exit code $EXIT_STATUS.${RESET}"
fi

echo -e "${YELLOW}---------------------------------------------------${RESET}"
echo -e "${YELLOW}End of rebuild process.${RESET}"
