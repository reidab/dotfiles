# Dotfiles

Dotfile storage and setup, based generally on https://www.atlassian.com/git/tutorials/dotfiles.

## Mac Setup

### Backblaze

Backblaze's `bzfileids.dat` stores a file ID for every non-excluded path on the system. It will grow uncontrollably when faced with the abyss of `node_modules` and `.git` dirs unless told otherwise. Before adding any data to the system, install [Backblaze](https://www.backblaze.com) so custom exclude rules can be applied before a large file list is built.

### Secrets

Some secret dotfiles are stored in private. Install them from the vault first.

### Installation

```sh
# Add those custom Backblaze exclude rules
curl https://gist.githubusercontent.com/reidab/70854eb8d226a522582c372339a53e8c/raw -o /Library/Backblaze.bzpkg/bzdata/bzexcluderules_editable.xml

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