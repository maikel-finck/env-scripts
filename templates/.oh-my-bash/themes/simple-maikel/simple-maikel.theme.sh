#!/usr/bin/env bash

# prompt themeing

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

function prompt_command() {
	PS1="${TITLEBAR}${orange}${reset_color}${white}\w${bold_yellow}$(scm_prompt_info)${normal} "
}

# scm themeing
SCM_THEME_PROMPT_DIRTY=" ${bold_red}x${normal}"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=":"

SCM_GIT_AHEAD_CHAR="${bold_red}↑${bold_yellow}"
SCM_GIT_BEHIND_CHAR="${bold_red}↓${bold_yellow}"

safe_append_prompt_command prompt_command
