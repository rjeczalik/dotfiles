#!/usr/bin/env bash

TOP=$(dirname "${BASH_SOURCE[0]}")

[ ! -f ~/.bashrc.d ] && ln -s {"${TOP}"/,~/.}bashrc.d
[ ! -f ~/.bashrc ] && ln -s {"${TOP}"/,~/.}bashrc
[ ! -f "${TOP}"/powerline-shell/powerline-shell.py ] && ( cd "${TOP}"/powerline-shell; ./install.py )
[ ! -f ~/powerline-shell.py ] && ln -s {"${TOP}"/powerline-shell/,~/}powerline-shell.py
