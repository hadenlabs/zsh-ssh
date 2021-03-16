#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function ssh::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_SSH_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_SSH_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_SSH_PATH}"/pkg/linux.zsh
      ;;
    esac

    # shellcheck source=/dev/null
    source "${ZSH_SSH_PATH}"/pkg/alias.zsh

}

ssh::pkg::main::factory
