#!/usr/bin/env fish

# Define some color codes
set RESET (tput sgr0)
set BOLD (tput bold)
set UNDERLINE (tput smul)
set RED (tput setaf 1)
set GREEN (tput setaf 2)
set YELLOW (tput setaf 3)
set BLUE (tput setaf 4)
set MAGENTA (tput setaf 5)
set CYAN (tput setaf 6)
set WHITE (tput setaf 7)

# Define a function to print in color
function print_in_color
    set color $argv[1]
    set -l message (string join " " $argv[2..-1])
    echo -e "$color$message$RESET"
end

# Print a header
print_in_color $CYAN "******************************************"
print_in_color $CYAN "*           NixOS Rebuild Script         *"
print_in_color $CYAN "******************************************"
echo ""

# Start the rebuild process
print_in_color $BLUE "Starting NixOS rebuild..."
echo ""

# Define the command
set command "sudo nixos-rebuild switch --flake .#nixos"

# Print the command to be run
print_in_color $YELLOW "Running command: $command"
echo ""

# Run the command and display logs
sudo nixos-rebuild switch --flake .#nixos

# Print a footer
echo ""
print_in_color $CYAN "******************************************"
print_in_color $CYAN "*            Rebuild Completed           *"
print_in_color $CYAN "******************************************"
