#!/bin/bash

packages=(
	"flake8"
	"grc"
	"python3-pip"
	"tmux"
	"tree"
	"vim"
	"zsh"
)

packages_arch=(
	"base-devel"
	"termite"
	"cmake"
	"os-prober"
	"python3"
	"ttf-font-awesome"
	"ttf-inconsolata"
	"wap_supplicant"
	"xorg-server"
	"xorg-xinit"
)

packages_deb=(
	"curl"
	"fonts-font-awesome"
)

python_deps=(
	"flake8"
	"requests"
)

install_fzf () {
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
}

install_packages () {
	command -v apt > /dev/null
	apt=$?
	command -v pacman > /dev/null
	pacman=$?
	if [ $apt -eq 0 ]
	then
		apt-get update
		shellcmd="apt install "
		$shellcmd ${packages_deb[@]}
		source scripts/mint_install_termite.sh
		source scripts/mint_install_spotify.sh
	elif [ $pacman -eq 0 ]
	then
		shellcmd="pacman -S "
		$shellcmd ${packages_arch[@]}
	else
		echo "No shell binary found"
		exit
	fi
	$shellcmd ${packages[@]}
}

set_permissions () {
	chmod -R +rx /etc/dotfiles
}

install_python_deps () {
	pip3 install ${python_deps[@]} --user
}


set_permissions
install_packages
install_python_deps
install_fzf
