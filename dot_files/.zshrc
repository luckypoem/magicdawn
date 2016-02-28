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

export JAVA_HOME=`/usr/libexec/java_home`

# JAVA 
export PATH=$JAVA_HOME/bin:$PATH

# maven
export PATH=$PATH:/Users/magicdawn/Programs/apache-maven-3.0.3/bin

# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/Users/magicdawn/gopath

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# cario
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# rust racer
export RUST_SRC_PATH=~/Downloads/soft/rust/rustc-1.1.0/src
## racer
export PATH=$PATH:~/study/rust/racer/target/release

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
# export NVM_NODEJS_ORG_MIRROR="http://npm.taobao.org/mirrors/node/"
# export NVM_IOJS_ORG_MIRROR='http://npm.taobao.org/mirrors/iojs'

# vscode
code () { 
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ; 
}

# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] &&
#  . $(brew --prefix)/etc/profile.d/autojump.sh

# z.sh
# . ~/z.sh

# 当前目录
export PATH=$PATH:.

# DOT_FILES
# Example: wget -q $DOT_FILES/.eslintrc
export DOT_FILES='https://raw.githubusercontent.com/magicdawn/magicdawn/master/dot_files'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting