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

function ssh::list {
    less "${HOME}"/.ssh/config | grep -i '^host[[:space:]]*' | sed 's/^[Hh][Oo][Ss][Tt][[:space:]]*//;'
}

function ssh::connect {
    local buffer
    buffer=$(ssh::list | fzf )
    if [ -n "${buffer}" ]; then
        # shellcheck disable=SC2164
        ssh "${buffer}"
    fi
}

zle -N ssh::connect
bindkey '^Xs' ssh::connect
