export PROMPT_HOST=aux_prompt

# Establishing prompt value
if [[ $UID == 0 || $EUID == 0 ]]
then 
	PROMPT='# %{$fg_bold[red]%}%p%{$fg[red]%}%c%{$fg_bold[red]%} $(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%} '
	ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%} "
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} \xef\x82\x9b% "
	ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} \xef\x82\x9b"
else
	PROMPT='$ $(host_prompt_info) %{$fg_bold[green]%}%p%{$fg[green]%}%c%{$fg_bold[cyan]%} $(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%} '
	ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%} "
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} \xef\x82\x9b% "
	ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} \xef\x82\x9b"
fi


