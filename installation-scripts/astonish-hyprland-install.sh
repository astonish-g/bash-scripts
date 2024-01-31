#!/bin/bash

# Check if running as root. If root, it will exit.
if [[ $EUID -eq 0 ]]; then
	echo "This script should not be executed as root! Exiting."
	exit 1
fi

clear

# Set some colors for output messages
# CAT="$(tput setaf 6)[ACTION]$[tput sgr0)"

# Function to display ASCII art
# Use the font big on the generator website
display_hello() {
	cat << "EOF"
           ____                         
          / ___| __ _ _ __ ___          
  _____  | |  _ / _` | '__/ _ \   _____ 
 |_____| | |_| | (_| | | | (_) | |_____|
          \____|\__,_|_|  \___/         
                                         
EOF
}

# Display ASCII art
display_hello

# clear screen
# clear

# Get the width of the terminal
echo "Welcome to my Arch-Linux installation."
echo
sleep 1
echo "WARNING: Please backup your files before proceeding."
echo
sleep 1

# Password warning message
echo "Some commands require you to enter your password in order to execute."
echo
sleep 1

# System-update
echo "If you haven't performed a system update for a long time, please cancel the installation with CTRL+C and perform a system update."
echo
sleep 1

# Proceed
read -n1 -rep "Shall we proceed with the installation? (y/n)" PROCEED
	echo
if [[ $PROCEED =~ ^[Yy]$ ]]; then
	echo "Alright, let's begin!" "${OK}"
else
	echo "NO changes were made to your system. Goodbye!" "${NOTE}"
	echo
	exit
fi

# clear screen
clear

# Check for AUR helper and install if not found.
ISAUR=$(command -v yay || command -v paru)

if [ -n "$ISAUR" ]; then
	echo "AUR helper was located, installation continues." "${OK}"
else
	echo "AUR helper was NOT found." "$WARN"

	while true; do
		read -rp "