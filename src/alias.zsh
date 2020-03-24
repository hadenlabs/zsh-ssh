#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

if type -p assh > /dev/null; then alias ssh="assh wrapper ssh"; fi
alias editassh='${EDITOR} ~/.ssh/assh.yml'
