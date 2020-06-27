alias python="python3"
alias python2="python2.7"
alias pip="pip3"
alias l="ls -lah"
alias c="clear"
alias tmx="tmux new-session -s main"
alias nmapb="grc nmap -sV -sC -oN nmap_basic.txt -vv "
alias nmapf="grc nmap -p- -oN nmap_full.txt -vv "
alias nmap="grc nmap"
alias vpn="sudo openvpn /home/berbus/Documents/berbus.ovpn"
alias gcm="git commit -m"
alias venv="source venv/bin/activate"

function ox509_der ()
{
	openssl x509 -in "$1" -inform der -text
}

function ox509_pem ()
{
	openssl x509 -in "$1" -noout -text
}

function ddok ()
{
	dd if="$1" of="$2" bs=1 count=99999999 skip="$3"
}

function len ()
{
	cat $1 | wc -l
}

function port ()
{
	aux=$(cat /etc/services | grep -P "\t$1/") 
	udp=$(echo "$aux" | grep -i udp)
	tcp=$(echo "$aux" | grep -i tcp)
	if [ ! -z "$udp" ] && [ ! -z "$tcp" ] ; then
		echo "UDP and TCP"
	elif [ ! -z "$tcp" ] ; then
		echo "TCP"
	elif [ ! -z "$udp" ] ; then
		echo "UDP"
	else
		echo "Port not found"
	fi
}

function portserv ()
{
	cat /etc/services | grep -P "\t$1/"
}

function git_prompt_info() {
	# Override git plugin function to shorten branch names
	max=8
	if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
		ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
		ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
		ref="$(command echo ${ref#refs/heads/})"
		if [[ ${#ref} -gt ${max} ]]; then
			ref="${ref:0:5}..."
		fi
		echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	fi
}
