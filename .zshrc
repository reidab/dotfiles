# From /etc/zshrc, since we disabled global RCs
################################################################################

# Correctly display UTF-8 with combining characters.
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
	setopt combiningchars
fi

disable log

[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"

# Fix the ZSH help path
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true

# Load Antigen and specify bundles

source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  autojump
  brew
  #capistrano
  colored-man-pages
  extract
  gem
  git-extras
  macos
  rails
  bundler
  rake-fast
  ssh-agent
  wfxr/forgit
  Peeja/oh-my-zsh plugins/rbenv
  Tarrasch/zsh-bd

  zsh-users/zsh-completions src
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
EOBUNDLES

antigen apply

#--[ Mac Keyboard Behavior ]---------------------------------------------------

bindkey "[D" backward-word
bindkey "[C" forward-word

#--[ Aliases ]-----------------------------------------------------------------

alias zshconfig="vimr -s ~/.zshrc"
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# search running processes
alias pgrep='ps aux | grep -i '
alias pg=pgrep

# always copy recursively
alias cp='cp -r'

# git rebase shortcuts
alias cont='git rebase --continue'
alias abort='git rebase --abort'
alias skip='git rebase --skip'

alias gg='git-gui &'
alias gx='gitx &'


alias run-integration="kubectl exec -n staging -i -t -c the-dyrt-api-worker \$(kubectl get pod -n staging --field-selector=status.phase=Running -l 'app=the-dyrt-api,component=worker,release=the-dyrt-api-integration' -o jsonpath='{.items[0].metadata.name}') -- "
alias c-integration="kubectl exec -n staging -i -t -c the-dyrt-api-worker \$(kubectl get pod -n staging --field-selector=status.phase=Running -l 'app=the-dyrt-api,component=worker,release=the-dyrt-api-integration' -o jsonpath='{.items[0].metadata.name}') -- bin/rails c"
alias run-staging="kubectl exec -n staging -i -t -c the-dyrt-api-worker \$(kubectl get pod -n staging --field-selector=status.phase=Running -l 'app=the-dyrt-api,component=worker,release=the-dyrt-api-stagin' -o jsonpath='{.items[0].metadata.name}') -- "
alias c-staging="kubectl exec -n staging -i -t -c the-dyrt-api-worker \$(kubectl get pod -n staging --field-selector=status.phase=Running -l 'app=the-dyrt-api,component=worker,release=the-dyrt-api-staging' -o jsonpath='{.items[0].metadata.name}') -- bin/rails c"
alias run-prod="kubectl exec -n production -i -t -c the-dyrt-api-worker \$(kubectl get pod -n production --field-selector=status.phase=Running -l 'app=the-dyrt-api,component=worker,release=the-dyrt-api-production' -o jsonpath='{.items[0].metadata.name}') -- "
alias c-prod="kubectl exec -n production -i -t -c the-dyrt-api-worker \$(kubectl get pod -n production --field-selector=status.phase=Running -l 'app=the-dyrt-api,component=worker,release=the-dyrt-api-production' -o jsonpath='{.items[0].metadata.name}') -- bin/rails c"

alias release-pr="git log --no-merges --author=@thedyrt.com --author=@kickstand.work --author=@reidbeels.com --no-decorate --topo-order --reverse --format='* %s' origin/master..origin/develop | pbcopy"

alias kc='kubectl'

alias v.='vimr -s .'
alias c.='code .'

weather() { curl http://wttr.in/$1; }

#-[ Prompt]--------------------------------------------------------------------
# $(rbenv version-name)
# PROMPT='
# %{$fg[magenta]%}%m %{$fg[white]%}:%(?.%).()  %{$fg[blue]%}%~$(git_prompt_info)  ${fg[yellow]}⟢
# %{$fg[green]%}%n %{$fg[cyan]%}➜%{$fg[white]%} '

RPROMPT='%{$fg_bold[blue]%} %t %{$fg[white]%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}   "
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[magenta]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%}"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/homebrew/api_token_env ] && source ~/.config/homebrew/api_token_env

eval "$(starship init zsh)"

export PATH="$HOME/.poetry/bin:$PATH"
