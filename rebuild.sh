#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

ART="
░█▀█░▀█▀░█░█░█▀█░█▀▀░░░█▀▄░█▀▀░█▀▄░█░█░▀█▀░█░░░█▀▄
░█░█░░█░░▄▀▄░█░█░▀▀█░░░█▀▄░█▀▀░█▀▄░█░█░░█░░█░░░█░█
░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀▀▀░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀▀░
"

echo -e "${BLUE}${ART}${RESET}"
echo -e "${YELLOW}Starting NixOS rebuild...${RESET}"

COMMAND="sudo nixos-rebuild switch --flake /home/zhai/.config/nixos/#nixos $*"

echo -e "${BLUE}Running command:${RESET} $COMMAND"
echo -e "${YELLOW}---------------------------------------------------${RESET}"

bash -c "$COMMAND" 2>&1

EXIT_STATUS=$?

if [ $EXIT_STATUS -eq 0 ]; then
  echo -e "${GREEN}Rebuild successful!${RESET}"
else
  echo -e "${RED}Rebuild failed with exit code $EXIT_STATUS.${RESET}"
fi

echo -e "${YELLOW}---------------------------------------------------${RESET}"
echo -e "${YELLOW}End of rebuild process.${RESET}"
