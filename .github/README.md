# Dotfiles

Dotfile storage and setup, based generally on https://www.atlassian.com/git/tutorials/dotfiles.

## Mac Setup

```sh
# Install XCode CLI tools
xcode-select --install

# Clone this repo into a bare git dir in `.cfg` and set up the `cfg` alias
git clone --bare git@github.com:reidab/dotfiles $HOME/.cfg
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
cfg config --local status.showUntrackedFiles no

# Checkout dotfiles into `$HOME`
cfg checkout

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brewfile packages
brew bundle --global 
```