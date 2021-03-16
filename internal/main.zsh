#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function ssh::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_SSH_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_SSH_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_SSH_PATH}"/internal/linux.zsh
      ;;
    esac
}

ssh::internal::main::factory

if ! core::exists curl; then core::install curl; fi
if ! core::exists fzf; then core::install fzf; fi
if ! core::exists jq; then core::install jq; fi
if ! core::exists less; then core::install less; fi
if ! core::exists assh; then core::install assh; fi
