# .bash_profile is executed for login shells, .bashrc for non-login shells

source /etc/profile

####################################
# Global
####################################

export EDITOR=vi
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR="YES"
export CVS_RSH=ssh

# search running processes
alias pgrep='ps aux | grep '
alias pg=pgrep

# always copy recursively
alias cp='cp -r'

# Ruby/Rails/Sinatra aliases
# provide a rails, sinatra, or ruby console
function sc {
  if [ -x script/console ]; then
    script/console
  else
    sinatra_rb=`egrep -l "^require.+sinatra.$" *.rb 2>/dev/null`
    if [ -e $sinatra_rb ]; then
      irb -r $sinatra_rb
    else
      irb
    fi
  fi
}

alias ss=script/server
alias sp=script/plugin
alias sd=script/destroy
alias sg=script/generate
alias r=rake
alias lfix='rake spec:db:fixtures:load'

# git rebase shortcuts
alias cont='git rebase --continue'
alias abort='git rebase --abort'
alias skip='git rebase --skip'
alias gg='git-gui &'

# shortcut for prettier svk lump pushes
alias svkpush='svk push --verbatim --lump --review'
if [ $(uname -s) == 'Darwin' ]; then
  export SVKMERGE='FileMerge'
  export SVKDIFF='colordiff'
  export SVN_EDITOR='mate -w'
fi

####################################
# Host-specific configuration
####################################

if [ -f ~/.dotfiles/hosts/$HOSTNAME/bashrc ]; then
  source ~/.dotfiles/hosts/$HOSTNAME/bashrc
fi