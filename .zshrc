source ~/.fonts/*.sh
precmd () {print -Pn "\e]0;\a"}
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

eval "$(pyenv virtualenv-init -)"

# References
# OhMyZsh: https://github.com/robbyrussell/oh-my-zsh
# Powerlevel9k: https://github.com/bhilburn/powerlevel9k
# Powerline fonts: https://github.com/powerline/fonts
# Awesome Terminal Fonts: https://github.com/gabrielelana/awesome-terminal-fonts
# ZSH Syntax Highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
#
# For more plugins search this repo: https://github.com/unixorn/awesome-zsh-plugins

USER=$(whoami)

# 256 color mode
export TERM="xterm-256color"

alias ls='ls $LS_OPTIONS'
alias cls=clear
alias move='mv -v'
alias mems='free -mh'
alias translate=translate-cli
alias lsd='ls -p | grep -i /'
alias lt='ls -larth'
alias move='mv -v -i'
alias copy='cp -v -i'

LS_COLORS='rs=0:di=0;96:ln=03;101;4:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=30;102:st=37;44:ex=01;32:*.run=0;100:*.json=01;37:*.tar=01;93:*.tgz=0;93:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=1;31;47:*.z=01;31:*.dz=01;31:*.gz=01;93:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;93:*.zst=01;31:*.tzst=01;31:*.bz2=01;93:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;101:*.rpm=01;31:*.jar=0;30;42:*.war=0;30;42:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=0;30;42:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;34:*.jpeg=01;34:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;34:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;34:*.tiff=01;34:*.png=01;34:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*.h=01;35';

export OPENSSL_CONF=/etc/ssl/

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh/custom/plugins/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="af-magic"
POWERLEVEL9K_MODE='awesome-fontconfig' # Powerlevel9k_mode must always come before ZST_THEME
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="alien-minimal/alien-minimal"
#ZSH_THEME="powerlevel10k/powerlevel10k"

################
# Powerlevel9k #
################
# Sidebars
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time custom_ruby custom_git_stats)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user pyenv custom_pyenv_icon dir vcs ssh)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_user_icon pyenv custom_pyenv_icon dir vcs ssh)
#POWERLEVEL9K_CUSTOM_PYENV="echo \$(python -c 'import sys; print(\".\".join(map(str, sys.version_info[:4])))')"
POWERLEVEL9K_CUSTOM_PYENV="echo \$(python -c 'import sys; print(\" \".join(map(str, sys.version.split(\" \")[:2]))[:-1].replace(\" (main\", \"\").replace(\" (default\", \"\"))')"
POWERLEVEL9K_CUSTOM_PYENV_BACKGROUND=11
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats nvm node_version rvm dir_writable date time load custom_containt_files)

width=$(tput cols)
max=115
maxdiv=77
maxdivxterm=81
maxqterm=128
if [[ $width == $maxqterm ]]; then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats nvm dir_writable date time load custom_containt_files)
elif (( $(bc <<<"$width > $max") )); then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats nvm node_version rvm dir_writable date time load custom_containt_files custom_state)
  ########
  # MOTD #
  ########
  if [[ ! $(whoami) == 'root' ]]; then
    fortune | cowsay -f dragon-and-cow
  fi
elif (( $(bc <<<"$width < $maxdivxterm") )); then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats dir_writable time custom_state)
elif (( $(bc <<<"$width < $max") )); then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats dir_writable time custom_containt_files custom_state)
elif (( $(bc <<<"$width < $maxqterm") )); then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats dir_writable time custom_containt_files custom_state)
else
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time custom_git_stats nvm dir_writable date time load custom_containt_files custom_state)
fi

POWERLEVEL9K_USER_ICON="\uF306" # 
POWERLEVEL9K_ROOT_ICON="\uE614"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 

POWERLEVEL9K_NODE_VERSION_FOREGROUND=7
POWERLEVEL9K_NODE_VERSION_BACKGROUND=53
POWERLEVEL9K_USER_ROOT_FOREGROUND=7
POWERLEVEL9K_USER_ROOT_BACKGROUND=1

# Custom Ruby
# Just shows a cute ruby icon (in red)
POWERLEVEL9K_CUSTOM_RUBY="echo '\Ue639 '"
POWERLEVEL9K_CUSTOM_RUBY_FOREGROUND="red"

#POWERLEVEL9K_USER_ICON="\uF306" # 
#POWERLEVEL9K_ROOT_ICON="\uE614"
#POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 

custom_user_icon() {
  if (( $(bc <<<"$width > $maxdivxterm") )); then
    if [[ $(whoami) == 'root' ]]; then
      echo "\uE614 $USER"
    else
      echo "\uF306 $USER"
    fi
  else
    if [[ $(whoami) == 'root' ]]; then
      echo "\uE614"
    else
      echo "\uF306"
    fi
  fi
}

POWERLEVEL9K_CUSTOM_USER_ICON="custom_user_icon"

POWERLEVEL9K_CUSTOM_PYENV_ICON="custom_pyenv_icon"
POWERLEVEL9K_CUSTOM_PYENV_ICON_FOREGROUND=120
POWERLEVEL9K_CUSTOM_PYENV_ICON_BACKGROUND=0

custom_pyenv_icon() {
  local check_py=$(python -c 'import sys; print(" ".join(map(str, sys.version.split(" ")[:2]))[:-1].replace(" (main", "").replace(" (default", ""))' 2>/dev/null)
  local pyv=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))' 2>/dev/null)
  if [[ -n $(echo $XTERM_VERSION) ]]; then
    echo "$pyv"
  else
    if [[ "$check_py" == *"Anaconda"* ]]; then
      POWERLEVEL9K_CUSTOM_PYENV_ICON_FOREGROUND=196
      POWERLEVEL9K_CUSTOM_PYENV_ICON_BACKGROUND=0
      if (( $(bc <<<"$width < $maxdivxterm") )); then
        echo "\U1F40D"
      else
        echo "$pyv \U1F40D"
      fi

    else
      if (( $(bc <<<"$width < $maxdivxterm") )); then
        echo "\uE63C"
      else
        echo "$pyv \uE63C"
      fi
    fi
  fi
}

POWERLEVEL9K_CUSTOM_CONTAINT_FILES="custom_containt_files"
################################################################
# Segment to diplay files type
custom_containt_files() {
  local dirdetect=$(dirdetect 2>/dev/null)
  local py=$(echo $dirdetect | awk '{ print $1; }')
  local rb=$(echo $dirdetect | awk '{ print $2; }')
  local pl=$(echo $dirdetect | awk '{ print $3; }')
  local js=$(echo $dirdetect | awk '{ print $4; }')
  local java=$(echo $dirdetect | awk '{ print $5; }')
  local html=$(echo $dirdetect | awk '{ print $6; }')
  local css=$(echo $dirdetect | awk '{ print $7; }')
  local md=$(echo $dirdetect | awk '{ print $8; }')
  local rst=$(echo $dirdetect | awk '{ print $9; }')

  local files

  if [[ $py != "0.00" ]]; then
    files="$py%%\U1F40D"
  fi

  if [[ $rb != "0.00" ]]; then
    files="$files $rb%%\uF219"
  fi

  if [[ $pl != "0.00" ]]; then
    files="$files $pl%%perl"
  fi

  if [[ $js != "0.00" ]]; then
    files="$files $js%%\u2B22"
  fi

  if [[ $java != "0.00" ]]; then
    files="$files $java%%\U2615"
  fi

  if [[ $html != "0.00" ]]; then
    files="$files $html%%html"
  fi

  if [[ $css != "0.00" ]]; then
    files="$files $css%%css"
  fi

  if [[ $md != "0.00" ]]; then
    files="$files $md%%md"
  fi

  if [[ $rst != "0.00" ]]; then
    files="$files $rst%%rst"
  fi

  echo $files
}

POWERLEVEL9K_CUSTOM_CONTAINT_FILES_FOREGROUND=7
POWERLEVEL9K_CUSTOM_CONTAINT_FILES_BACKGROUND=18

# Custom Git stats
# Displays listing of files changes, insertions, and deletions made for the current branch
POWERLEVEL9K_CUSTOM_GIT_STATS="custom_git_stats"

custom_git_stats() {
  # https://tecadmin.net/bash-shell-test-if-file-or-directory-exists/#
  if test -d .git
  then
    local total_changed=0
    local total_insertions=0
    local total_deletions=0

    # TODO: Clean up while loops
    # Either memoize git diff results
    # Or only loop once while matching separately in grep
    {git diff --shortstat --cached; git diff --shortstat} | grep -P '\d+ (?=files? changed)' -o | while read value; do
      (( total_changed = total_changed + $value ))
    done

    {git diff --shortstat --cached; git diff --shortstat} | grep -P '\d+ (?=insertions?)' -o | while read value; do
      (( total_insertions = total_insertions + $value ))
    done

    {git diff --shortstat --cached; git diff --shortstat} | grep -P '\d+ (?=deletions?)' -o | while read value; do
      (( total_deletions = total_deletions + $value ))
    done

    # No circle
    # + \Uf067
    # - \Uf068

    echo "\Uf15c $total_changed \Uf055 $total_insertions \Uf056 $total_deletions"
  fi
}

# Element styles
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_HOME_FOREGROUND=0
POWERLEVEL9K_DIR_HOME_BACKGROUND=108
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=0
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=115
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=0
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=130
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="white"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="blue"

# POWERLEVEL9K_DIR_BACKGROUND=130
# POWERLEVEL9K_DIR_FOREGROUND=254
# POWERLEVEL9K_DIR_FOREGROUND=0

custom_state() {
  if [[ $(whoami) == 'root' ]]; then
    POWERLEVEL9K_DIR_FOREGROUND=7
    POWERLEVEL9K_DIR_BACKGROUND=1
    POWERLEVEL9K_CUSTOM_USER_ICON_FOREGROUND=7
    POWERLEVEL9K_CUSTOM_USER_ICON_BACKGROUND=1
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=0
  else
    if [[ -n $(echo $XTERM_VERSION) ]]; then
      POWERLEVEL9K_DIR_FOREGROUND=0
      POWERLEVEL9K_DIR_HOME_FOREGROUND=0
      POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=0
      POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=0
      POWERLEVEL9K_TIME_DEFAULT_FOREGROUND=0
      POWERLEVEL9K_TIME_ICON_DEFAULT_FOREGROUND=0
      POWERLEVEL9K_TIME_FOREGROUND=0
      POWERLEVEL9K_TIME_ICON_FOREGROUND=0
    else
      POWERLEVEL9K_DIR_FOREGROUND=7
      POWERLEVEL9K_DIR_BACKGROUND=128
      POWERLEVEL9K_CUSTOM_USER_ICON_FOREGROUND=0
      POWERLEVEL9K_CUSTOM_USER_ICON_BACKGROUND=7
    fi
  fi
}

POWERLEVEL9K_CUSTOM_STATE="custom_state"

# Prompt Line
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} \Uf017 `date +%I:%M:%S` `date +%P` %f%k%F{white}?%f "
###############################

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
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
#plugins=(git rails ruby rvm sublime command-not-found jsontools npm nyan web-search bundler auto-fortune-cowsay zsh-syntax-highlighting pyenv zsh-pyenv)
plugins=(git rails ruby rvm sublime command-not-found jsontools npm nyan web-search bundler zsh-syntax-highlighting pyenv zsh-pyenv virtualenv aterminal zpy autopep8 themes nvm python ruby title)

source $ZSH/oh-my-zsh.sh
EDITOR='nano'
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#########
# Paths #
#########
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

##################
# Custom Plugins #
##################
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

########################
# User-defined Aliases #
########################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconfig="scite ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ag="alias | grep"

# Rails helpers
alias remove-server-pid="rm -rf tmp/pids/server.pid && kill-process-by name ruby"

# Octopress
#alias os="jekyll serve --config _config.dev.yml"
#alias od="jekyll build --config _config.yml && octopress deploy"

# Gem helpers
alias pryr="pry-remote"

# Application Helpers
#alias spotify-1080="spotify --force-device-scale-factor=1"

# Service helpers
alias redis-start="sudo service redis_6379 start"
alias redis-stop="sudo service redis_6379 stop"
alias postgres-start="sudo /etc/init.d/postgresql start"
alias elasticsearch-start="sudo service elasticsearch start"

# Work helpers
#alias lessonly-psql="psql --dbname=lessonly_development"

########################
# User-defined Methods #
########################
# Kill Process by
#
# port - All processes with port will be killed
# name - All processes given a name will be killed
function zkill()
{
  case $1 in
  port )
    kill -9 $(lsof -ti tcp:$2)
    ;;
  name )
    kill -9 $(lsof -t -c $2)
    ;;
  esac
}

function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="$*\a\]"
  PS1=${ORIG}${TITLE}
  PROMPT_TITLE=${TITLE}
}

set-title2(){
	ORIG=$PS1
	TITLE="\e]2;$@\a"
	PS1=${ORIG}${TITLE}
    PROMPT_TITLE=${ORIG}${TITLE}
}

function settitle()
 {
     if [ $# -eq 0 ]
         then
         eval set -- "\\u@\\h: \\w"
     fi
	    case $TERM in
         xterm*) local title="\[\033]0;$@\007\]";;
         *) local title=''
     esac
     local prompt=$(echo "$PS1" | sed -e 's/\\\[\\033\]0;.*\\007\\\]//')
     PS1="${title}${prompt}"
     PROMPT_TITLE="${title}${prompt}"
 }

DEBUGGER_PORT=50001
function set-debug-server() {
	export DEBUG_SERVER=1
	if [[ -n "$1" ]]; then
		export DEBUGGER_SERVER=$1
	fi
}

function set-debug() {
	export DEBUG=1
}

function unset-debug-server() {
	unset DEBUG_SERVER
	unset DEBUGGER_SERVER
}

function unset-debug() {
	unset DEBUG
}

function setdebugserver() {
	export DEBUG_SERVER=1
	if [[ -n "$1" ]]; then
		export DEBUGGER_SERVER=$1
	fi
}

function setdebug() {
	export DEBUG=1
}

function unsetdebugserver() {
	unset DEBUG_SERVER
	unset DEBUGGER_SERVER
}

function unsetdebug() {
	unset DEBUG
}

function setcarto() {
	export DATABASE_URL=postgis://postgres:postgis@localhost:5432/cartoview
	export DATASTORE_DATABASE_URL=postgis://postgres:postgis@localhost:5432/cartoview_datastore
	export ALLOWED_HOSTS=['*']
	export DJANGO_SETTINGS_MODULE=cartoview.settings
	export DEFAULT_BACKEND_UPLOADER=geonode.importer
}

function setcartoview() {
	export DATABASE_URL=postgis://postgres:postgis@localhost:5432/cartoview
	export DATASTORE_DATABASE_URL=postgis://postgres:postgis@localhost:5432/cartoview_datastore
	export ALLOWED_HOSTS=['*']
	export DJANGO_SETTINGS_MODULE=cartoview.settings
	export DEFAULT_BACKEND_UPLOADER=geonode.importer
}

#synclient tapbutton1=1
#. "$HOME/.cargo/env"

export PATH=$PATH:~/.local/bin
export PATH="$PATH:/opt/mssql-tools/bin"

function path_repl {
    echo $PATH | awk -F: -f rem.awk REM="$1" REP="$2" | paste -sd:
}

__conda_setup="$('/sdk/anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/sdk/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/sdk/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/sdk/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PYTHONSTARTUP=/projects/PYTHONSTARTUP.py
