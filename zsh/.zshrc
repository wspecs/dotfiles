# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wendly/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  docker-compose
  git
  sudo
  tmux
  ubuntu
)

source $ZSH/oh-my-zsh.sh

# User configuration

ls='ls --color=tty -l'
grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
d='dirs -v | head -10'

alias -g G='| grep -i'

# =========================
# Git ZSH Helper methods
# =========================
git_init() {
  git init
  git add --all
  git commit -m 'first commit'
  git remote add origin https://github.com/wspecs/$1.git
  git push -u origin master
}

push_to_git() {
  git pull
  git status
  git add --all
  git commit -m $1
  git push
}

# =========================
# Node ZSH Helper methods
# =========================
new-module() {
  tsm-starter $1 --config=~/.tsm-starter.json --destination=$(pwd)/$1
}

patch() {
  tsc && node-readme && npm run build && npm test
  push_to_git $1
  NEW_VERSION=$(npm version patch -m $1)
  push_to_git "published $NEW_VERSION"
  npm publish
}

minor() {
  tsc && node-readme && npm run build && npm test
  push_to_git $1
  NEW_VERSION=$(npm version minor -m $1)
  push_to_git "published $NEW_VERSION"
  npm publish
}
