#!/usr/bin/env bash

# ~/bin
PATH=${HOME}/bin:${PATH}

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Sublime Text 3
PATH=/Volumes/Sublime\ Text/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH

# pkg-config /usr/local/Library/ENV/pkgconfig/10.8
PKG_CONFIG_PATH=/usr/local/Cellar/libxml2/2.9.1/lib/pkgconfig:$PKG_CONFIG_PATH

# XCode (clang)
# PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH
# PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH

# git and other brew apps
PATH=/usr/local/bin:${PATH}

# gcc
# PATH=/usr/local/Cellar/gcc48/4.8.1/bin:$PATH

# Vim
PATH=${HOME}/Applications/MacVim.app/Contents/MacOS:${PATH}


# Misc
CLICOLOR=1
PYTHONPATH=${HOMEBREW_PREFIX}/lib/python2.6/site-packages
EDITOR=Vim

# Aliases
alias ls='ls -Fla'

# Export all
export PATH PKG_CONFIG_PATH TERM HOMEBREW_GITHUB_API_TOKEN CLICOLOR PYTHONPATH EDITOR

# Source ~/.bashrc.d/*
for s in "${HOME}"/.bashrc.d/*; do
  [ -f "${s}" ] && [ -x "${s}" ] && source "${s}";
done

# Perl
export PERL_LOCAL_LIB_ROOT="/Users/rjeczalik/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/rjeczalik/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/rjeczalik/perl5";
export PERL5LIB="/Users/rjeczalik/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/rjeczalik/perl5/bin:$PATH";
