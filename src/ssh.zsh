#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines functions for ssh for history for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

function ssh::list {
    less "${SSH_CONFIG_FILE}" | grep -i '^host[[:space:]]*' | sed 's/^[Hh][Oo][Ss][Tt][[:space:]]*//;'
}

function ssh::build {
    assh config build > "${SSH_CONFIG_FILE}"
}

function ssh::connect {
    ssh::build
    local buffer
    buffer=$(ssh::list | fzf )
    if [ -n "${buffer}" ]; then
        # shellcheck disable=SC2164
        ssh "${buffer}"
    fi
}
