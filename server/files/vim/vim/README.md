# mReschke Custom VIM

All new custom and OS agnostic vim configuration with vim-plug


## Installation

If you are part of the mreschke family, then simply use `manup install vimrc`...you'll know what that means.

Everyone else:
* `cd /etc`
* `sudo mv vim vim-original`
* `sudo git clone git@github.com:mreschke/vimrc vim`
* `ln -s /etc/vim ~/.vim`
* `sudo ln -s /etc/vim /usr/share/vim/vimfiles` tested on debian
* Open vim and run `:PlugInstall`


## Manup Sources

This is for mreschke only while packaging manup sources.

All of the vim-plug plugins in `plugged` directory are git submodules, so they are not included when you clone git.  For manup I want the `plugged` directory fully populated which means after I `git pull` I need to open actual vim with this actual manup vim folder and run `:PlugInstall`, then do a manup `./package`.  Thus my `linstore` `~/.vim` is a symlink into the actual manup sources.  So simply `git pull` form the manup source dir then open vim on `linstore` and run `:PlugInstall`, then './package'...

