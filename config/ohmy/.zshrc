
export ZSH="$HOME/.oh-my-zsh"

export EDITOR='vim'
export VISUAL='vim'

ZSH_THEME="robbyrussell"
plugins=(git)

ZSH_THEME="clouzz"

plugins=(
	git
	pep8
	pip
	python
	plugged
	z
)

export ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export TERM=xterm-256color

export FZF_DEFAULT_COMMAND="fd ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
