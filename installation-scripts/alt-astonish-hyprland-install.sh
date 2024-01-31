#!/bin/bash

# This is the installation script to my dotfiles.
# This was made for a personal use. I am not a developper and my Linux knowledge is limited.
# So I hope that it works for you as well. Enjoy it.
# Ideally, run it on a fresh install of an EndeavourOS as it is what I use.
# Now let's start!

function checkRoot {
	echo "Welcome to the installation script."
	echo "First of all, we will update your system."
	echo "You should run this script as root."

	if [ "$EUID" -ne 0 ]
		then echo "You are not running it as root."
		exit
	fi
}

checkRoot &&

function systemUpdate {
	echo
	echo "Starting a full system update for Arch based systems"
	echo
	sudo pacman -Syu &&
	echo
	echo "System updated, now let's update the AUR packages"
	echo
	yay -Syu &&
	echo
	echo "Congrats! Your system is up to date no."
	echo "Proceeding with the installation of the dot files"
}

systemUpdate &&

# Install GIT if not installed
sudo pacman -S git --needed --noconfirm &&

# Let's download the dot files.
git clone <insert the repostiroy here> #create repository

# Install all the necessary apps
sudo pacman -S alacritty nemo nemo-fileroller waybar --needed --noconfirm &&
yay -S hyprland-git --answerclean