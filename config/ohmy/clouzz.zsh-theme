if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX=$' \xef\x83\x90 '
fi

# Establishing prompt value
if [[ $UID == 0 || $EUID == 0 ]]
then 
	PROMPT='$ZSH_THEME_CLOUD_PREFIX %{$fg_bold[red]%}%p%{$fg[red]%}%c%{$fg_bold[red]%} $(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%} '
	ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%} "
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} \xef\x82\x9b% "
	ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} \xef\x82\x9b"
else
	PROMPT='$ZSH_THEME_CLOUD_PREFIX %{$fg_bold[green]%}%p%{$fg[green]%}%c%{$fg_bold[cyan]%} $(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%} '
	ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%} "
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} \xef\x82\x9b% "
	ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} \xef\x82\x9b"
fi


