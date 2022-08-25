# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source ~/.fonts/*.sh

export TERM=xterm

alias lt="ls -larth"
alias move="mv -v -i"
alias copy="cp -v -i"
alias translate=translate-cli
alias cls=clear
alias ls='ls -p --color'
alias lsd='ls -p | grep -i /'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;93m\]\u@\h\[\033[00m\]:\[\033[01;92m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PYTHONSTARTUP=/projects/PYTHONSTARTUP.py
# LS_COLORS='rs=0:di=0;96:ln=03;101;4:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=3;96:st=37;44:ex=01;104:*.run=0;100:*.json=01;37:*.tar=01;93:*.tgz=0;93:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;93:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;101:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;103:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
LS_COLORS='rs=0:di=0;96:ln=03;101;4:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=30;102:st=37;44:ex=01;32:*.run=0;100:*.json=01;37:*.tar=01;93:*.tgz=0;93:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=1;31;47:*.z=01;31:*.dz=01;31:*.gz=01;93:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;93:*.zst=01;31:*.tzst=01;31:*.bz2=01;93:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;101:*.rpm=01;31:*.jar=0;30;42:*.war=0;30;42:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=0;30;42:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;34:*.jpeg=01;34:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;34:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;34:*.tiff=01;34:*.png=01;34:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*.h=01;35';
export LS_COLORS
export PATH=/usr/sbin:$PATH
export OPENSSL_CONF=/etc/ssl/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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

function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

set-title2(){
	ORIG=$PS1
	TITLE="\e]2;$@\a"
	PS1=${ORIG}${TITLE}
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

export PYENV_ROOT="/projects/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

eval "$(pyenv virtualenv-init -)"

#export "$(dbus-launch)"
synclient tapbutton1=1

function path_repl {
    echo $PATH | awk -F: -f rem.awk REM="$1" REP="$2" | paste -sd:
}

function path_app {
    echo $PATH | awk -F: -f app.awk REP="$1" IDX="$2" | paste -sd:
}

function replace_path() {
    if [ -d "$2" ] ; then
        local D=":${PATH}:";
        if [ "${D/:$1:/:}" != "$D" ] ; then
            PATH="${D/:$1:/:$2:}";
            PATH="${PATH/#:/}";
            export PATH="${PATH/%:/}";
        fi
    fi
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

exec zsh
