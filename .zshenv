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

export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$JAVA_HOME/bin:$PATH"

export ANDROID_HOME=/Users/reidab/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/code/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

if which nodenv > /dev/null; then
  eval "$(nodenv init -)";
  export PATH=$(yarn global bin):$PATH
fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
