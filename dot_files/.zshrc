# Path to your oh-my-zsh installation.
export ZSH=/Users/magicdawn/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="steeef"
# ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node npm gulp brew fasd)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="/Users/magicdawn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# golang
export GOPATH=/Users/magicdawn/gopath
export PATH=$PATH:$GOPATH/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# cario
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# npm version `patch` `minor` `major`
for x in patch minor major; do
  alias npm-$x="npm version $x && npm publish && gp origin --all && gp origin --tags"
done

## npm proxy
# 1. npm -> 8000(http) -> 1080(shadowsocks) -> npm_registry
function npm-proxy(){
  HTTP_PORT=10086
  SOCKS_PORT=1080

  # start shadowsocks
  open -a ShadowsocksX

  # set npm proxy
  # 1. delete old
  for x in proxy http-proxy http_proxy proxy; do
    npm config delete $x
  done
  # 2. set
  npm config set proxy http://127.0.0.1:$HTTP_PORT

  # start kneesocks
  # blocked
  DEBUG=proxy kneesocks $HTTP_PORT $SOCKS_PORT

  # if exit
  echo '---------- process about 10086 --------------'
  ps -ax | grep $HTTP_PORT
}

# NVM
export NODEJS_ORG_MIRROR="http://npm.taobao.org/mirrors/node/"
export IOJS_ORG_MIRROR='http://npm.taobao.org/mirrors/iojs'

# DOT_FILES
# Example: wget -q $DOT_FILES/.eslintrc
export DOT_FILES='https://raw.githubusercontent.com/magicdawn/magicdawn/master/dot_files'

#
# git use fengjr
#
git-config-fengjr(){
  git config user.name "岑涛"
  git config user.email "tao.cen@fengjr.com"
}

#
# JAVA
#
export JAVA_HOME="/Library/Java/Home"
export CLASS_PATH="$JAVA_HOME/lib"
# already works on osx
# export PATH="$PATH:$JAVA_HOME/bin"

#
# 当前目录, 保持在最后
#
export PATH=$PATH:.


#
# try to be humble
#
alias pls=sudo
alias please=sudo

#
# pyenv
#
if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
fi

