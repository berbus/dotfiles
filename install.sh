#!/bin/bash

packages=(
	"flake8"
	"grc"
	"python3-pip"
	"ripgrep"
	"tmux"
	"tree"
	"vim"
	"zsh"
)

packages_arch=(
	"base-devel"
	"termite"
	"cmake"
	"fd"
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
	"fd-find"
	"fonts-font-awesome"
)

python_deps=(
	"flake8"
	"requests"
	"yapf"
)

cargo_packages=(
	"ripgrep"
	"fd-find"
)
packages_macos=(
	"fd"
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
	command -v brew > /dev/null
	brew=$?
	if [ $apt -eq 0 ]
	then
		apt-get update
		shellcmd="apt install "
		$shellcmd ${packages_deb[@]}
		source scripts/mint_install_termite.sh
		# source scripts/mint_install_spotify.sh
	elif [ $pacman -eq 0 ]
	then
		shellcmd="pacman -S "
		$shellcmd ${packages_arch[@]}
	elif [ $pacman -eq 0 ]
	then
		# TODO - check if mac
		shellcmd="brew install "
		$shellcmd ${packages_macos[@]}
	else
		echo "No shell binary found"
		exit
	fi
	$shellcmd ${packages[@]}
	cargo install ${cargo_packages[@]}
}

set_permissions () {
	chmod -R +rx /etc/dotfiles
}

install_python_deps () {
	pip3 install ${python_deps[@]} --user
}

setup_rust () {
	curl https://sh.rustup.rs -sSf | sh
}


set_permissions
setup_rust
install_packages
install_python_deps
install_fzf
