# .bash_profile is executed for login shells, .bashrc for non-login shells

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# set up named colors
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BROWN="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[1;37m\]"
UNDERLINE="\[\033[4m\]"
NO_COLOUR="\[\033[0m\]"

function parse_git_branch {
  if [ $(which git-symbolic-ref) ]; then
    ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    echo " : ${ref#refs/heads/}"
  fi
}

function return_value_indicator {
  if [ $? == 0 ]; then echo ':)'; else echo ':('; fi
}

function rvm_prompt_reidab {
  if [ -f ~/.rvm/bin/rvm-prompt ]; then
    rvm_result=$(~/.rvm/bin/rvm-prompt)
    if [ ${rvm_result} != 'system' ]; then echo " ∴ ${rvm_result}"; fi
  fi
}

function prompt {
  PS1="$WHITE\n[$PURPLE\h $WHITE\$(return_value_indicator) $BLUE\w$RED\$(parse_git_branch)$YELLOW\$(rvm_prompt_reidab)$WHITE] \n$GREEN\u$WHITE\$ $WHITE"
}

# set the prompt
prompt