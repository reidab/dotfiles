# Disable the ZSH init files in /etc, since we want to prepend to the path
setopt no_global_rcs

# From /etc/zprofile
################################################################################
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export FZF_DEFAULT_COMMAND='ag -g ""'
export BUNDLER_EDITOR="vimr -n"
export EDITOR="nvim"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/share/android-sdk/platform-tools:$PATH
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_HOME="/usr/local/share/android-sdk"
# export ANDROID_NDK_HOME="/usr/local/share/android-ndk"

if which nodenv > /dev/null; then
  eval "$(nodenv init -)";
  export PATH=$(yarn global bin):$PATH
fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

if [ -f '/Users/reidab/code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/reidab/code/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/reidab/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/reidab/code/google-cloud-sdk/completion.zsh.inc'; fi

export GOPATH=$HOME/code/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
