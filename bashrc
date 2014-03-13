# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable coloured commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Make cp and mv safe by default (prompt before overwriting)
alias mv='mv -i'
alias cp='cp -i'

# Coloured prompt
BLACK="\[\033[0;30m\]"
BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"

export PS1="$GREENBOLD\u$WHITE: $BLUEBOLD\W$WHITE $ "

# USYD proxy configuration (don't use this at home)
# export HTTP_PROXY=web-cache.usyd.edu.au:8080
# export FTP_PROXY=$HTTP_PROXY

