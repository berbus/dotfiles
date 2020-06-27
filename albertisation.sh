#!/usr/bin/env bash

setup_vim () {
	rm -f ~/.vimrc
	ln -s /etc/dotfiles/config/vim/vimrc ~/.vimrc
}

setup_ohmyzsh () {
	mkdir -p ~/.config/.logs
	chsh -s $(which zsh)
	cd /tmp
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	rm -f ~/.zshrc
	ln -s /etc/dotfiles/config/ohmy/.zshrc ~/.zshrc
	ln -s /etc/dotfiles/config/ohmy/plugged ~/.oh-my-zsh/custom/plugins/ 
	ln -s /etc/dotfiles/config/ohmy/clouzz.zsh-theme ~/.oh-my-zsh/custom/themes
	cd - 
}

setup_termite () {
	ln -s /etc/dotfiles/config/termite/termite ~/.config/
	ln -s /etc/dotfiles/config/termite/gtk-3.0 ~/.config/
}

setup_tmux () {
	rm -f /etc/tmux.conf
	ln -s /etc/dotfiles/config/tmux/tmux.conf /etc/
}

setup_flake8 () {
	rm -f $HOME/.config/flake8
	mkdir -p $HOME/.config
	ln -s /etc/dotfiles/config/flake8/flake8 $HOME/.config/flake8
}

setup_vim
setup_termite
setup_tmux
setup_flake8
setup_ohmyzsh