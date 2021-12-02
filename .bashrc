#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="[\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\] \W]\$ "

pokemon-colorscripts -r
#printf "\nLa perfezione non è il nostro obiettivo, è la nostra tendenza \n		- Youtubo\n\n"
alias yd="youtube-dl"
alias yd-mus="youtube-dl -x"
alias zoom="flatpak run us.zoom.Zoom"
eval "$(starship init bash)"
# Added by zap installation script
PATH=$PATH:$HOME/.local/bin
