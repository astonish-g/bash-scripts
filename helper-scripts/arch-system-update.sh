#!/bin/bash

function systemUpdate {
	echo
	echo "Hello. The system will start a complete update now."
	echo "Now please enter your root password."
	echo
	sudo pacman -Syu &&
	echo
	echo "Great! We have updated the system."
	echo "Let's update the remaining AUR packages."
	echo
	yay -Syu &&
	echo
	echo "AUR packages are updated too."
	echo "Congrats! Your system is up to date now."
	echo
}

function reboot {
	echo "Would you like to reboot your computer? (y/n)" &&
	read x &&
	[[ "$x" == "y" ]] &&
	/sbin/reboot
}

systemUpdate &&
reboot