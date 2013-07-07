#!/bin/bash

# Packages commands
INSTALL="pacman -Syu"
INSTALL_PACKAGE="pacman -U"

# Install MAKE
if ! type "make" > /dev/null; then
	echo "install make..."
	sudo $INSTALL make
fi

# Install GCC
if ! type "gcc" > /dev/null; then
	echo "install gcc..."
	sudo $INSTALL gcc
fi

# Install GNOME TWEAK TOOL
if ! type "gnome-tweak-tool" > /dev/null; then
	echo "install gnome-tweak-tool..."
	sudo $INSTALL gnome-tweak-tool
fi

# Install VIM
if ! type "vim" > /dev/null; then
	echo "install vim..."
	sudo $INSTALL vim
fi

# Install GIT
if ! type "git" > /dev/null; then
	echo "install git..."
	sudo $INSTALL git
fi

# Install SSH
if ! type "ssh" > /dev/null; then
	echo "install ssh..."
	sudo $INSTALL openssh
fi

# Install CNF
if ! type "cnf" > /dev/null; then
	echo "install command-not-found..."
	wget "https://aur.archlinux.org/packages/co/command-not-found/command-not-found.tar.gz"
	tar xvzf "command-not-found.tar.gz"
	cd "command-not-found"
	makepkg -s
	sudo $INSTALL_PACKAGE command-not-found*.tar.xz
	cd ..
	rm command-not-found* -rf
	sudo cp /usr/bin/cnf-lookup /usr/bin/cnf
fi

echo "apps installed !"
