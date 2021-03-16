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

# shellcheck disable=SC2034  # Unused variables left for readability
ZSH_SSH_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_SSH_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_SSH_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_SSH_PATH}"/pkg/main.zsh

zle -N ssh::connect
bindkey '^Xs' ssh::connect
