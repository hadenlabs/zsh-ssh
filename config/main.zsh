#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function ssh::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_SSH_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_SSH_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_SSH_PATH}"/config/linux.zsh
      ;;
    esac
}

ssh::config::main::factory