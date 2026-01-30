# shellcheck shell=bash
# sourced by bash for interactive shells
[[ $- == *i* ]] || return
PS1='\[\e[1;35m\]$BUBBLE_INDICATOR\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\$ '
HISTSIZE=1000
shopt -s histappend
