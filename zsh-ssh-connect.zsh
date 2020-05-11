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

SSH_PLUGIN_DIR="$(dirname "${0}")"
export SSH_SOURCE_PATH="${SSH_PLUGIN_DIR}"/src
export SSH_CONFIG_FILE="${HOME}"/.ssh/config

export SSH_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export SSH_MESSAGE_NVM="Please install NVM or use antibody bundle luismayta/zsh-nvm branch:develop"

# shellcheck source=/dev/null
source "${SSH_SOURCE_PATH}"/base.zsh

# ssh::cross::os functions for osx and linux
function ssh::cross::os {

    case "${OSTYPE}" in
        linux*)
            # shellcheck source=/dev/null
            source "${SSH_SOURCE_PATH}"/linux.zsh
            ;;
        darwin*)
            # shellcheck source=/dev/null
            source "${SSH_SOURCE_PATH}"/osx.zsh
            ;;
    esac

}

ssh::cross::os

# shellcheck source=/dev/null
source "${SSH_SOURCE_PATH}"/alias.zsh

# shellcheck source=/dev/null
source "${SSH_SOURCE_PATH}"/helpers.zsh

# shellcheck source=/dev/null
source "${SSH_SOURCE_PATH}"/ssh.zsh

zle -N ssh::connect
bindkey '^Xs' ssh::connect
