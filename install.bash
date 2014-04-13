#!/usr/bin/env bash

TOP=$(dirname "${BASH_SOURCE[0]}")

for f in bashrc bashrc.d vimrc vim; do
	[ ! -f ~/.${f} ] && [ ! -d ~/.${f} ] && {
		echo "# symlinking ${TOP}/${f} -> ~/.${f}"
		ln -s {"${TOP}"/,~/.}${f}
	}
done

