#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines fzf ssh connect and provides easy command line file and folder sharing.
#
# Requirements:
#  - fzf: https://github.com/junegunn/fzf
#  - zsh: https://www.zsh.org/
#
# Based on: https://github.com/gko/ssh-connect
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

export ssh_package_name=fzf

SSH_PLUGIN_DIR="$(dirname "${0}":A)"
SSH_SOURCE_PATH="${SSH_PLUGIN_DIR}"/src

export SSH_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export SSH_MESSAGE_NVM="Please install NVM or use antibody bundle luismayta/zsh-nvm branch:develop"

# shellcheck source=/dev/null
source "${SSH_SOURCE_PATH}"/base.zsh

function ssh-history {
    cat "${HISTFILE}" | grep -E "^ssh\s" | sort -nr | uniq
}

function ssh_connect {
    BUFFER=$(fc -l -n 1 | ssh-history | \
                 fzf-tmux --query="${LBUFFER}")

    CURSOR=$#BUFFER # move cursor
    zle -R -c       # refresh
}

zle -N ssh_connect
bindkey '^F' ssh_connect
