#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines peco ssh connect and provides easy command line file and folder sharing.
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

ssh_package_name=fzf

plugin_dir=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/tools.zsh

# ripgrep::install - install ripgrep
function ripgrep::install {
    if [ -x "$(command which brew)" ]; then
        brew install ripgrep
    fi
}

# fzf::install - install fzf
function fzf::install {
    if [ -x "$(command which brew)" ]; then
        brew install fzf
    fi
}

if ! type -p rg > /dev/null; then ripgrep::install; fi
if ! type -p fzf > /dev/null; then fzf::install; fi

if [ -x "$(command which rg)" ]; then
    # Setting rg as the default source for fzf
    export FZF_DEFAULT_COMMAND='rg --files'

    # Apply the command to CTRL-T as well
    export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
fi

# assh::install - install assh
function assh::install {
    if [ -x "$(command which brew)" ]; then
        brew install assh
    fi
}

if ! type -p assh > /dev/null; then assh::install; fi
if type -p assh > /dev/null; then alias ssh="assh wrapper ssh"; fi

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
