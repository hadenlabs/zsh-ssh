#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines peco ssh connect and provides easy command line file and folder sharing.
#
# Requirements:
#  - peco: https://github.com/peco/peco
#  - zsh: https://www.zsh.org/
#
# Based on: https://github.com/gko/ssh-connect
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

if (( $+commands[peco] )); then
    function ssh-history() {
        cat "$HISTFILE" | grep -E "^ssh\s" | sed -e 's/\s*$//' | sort | uniq -c | sort -nr | sed -e "s/^\s*[0-9]*\s//"
    }
    function peco_ssh_connect() {
        BUFFER=$(fc -l -n 1 | ssh-history | \
                     peco --layout=bottom-up --query "$LBUFFER")

        CURSOR=$#BUFFER # move cursor
        zle -R -c       # refresh
    }

    zle -N peco_ssh_connect
    bindkey '^F' peco_ssh_connect
fi
