#!/usr/bin/env bash

TOP=$(dirname "${BASH_SOURCE[0]}")

for f in bashrc bashrc.d vimrc vim; do
	[ ! -f ~/.${f} ] && [ ! -d ~/.${f} ] && {
		echo "# symlinking ${TOP}/${f} -> ~/.${f}"
		ln -s {"${TOP}"/,~/.}${f}
	}
done

[ ! -f "${TOP}"/powerline-shell/powerline-shell.py ] && ( cd "${TOP}"/powerline-shell; ./install.py )
[ ! -f ~/powerline-shell.py ] && ln -s {"${TOP}"/powerline-shell/,~/}powerline-shell.py
