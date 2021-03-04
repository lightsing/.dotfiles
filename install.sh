#!/bin/bash
cd ~/.dotfiles
# git pull

# Git
ln -svf ~/.dotfiles/git/.gitconfig ~
ln -svf ~/.dotfiles/git/.gitattributes ~

# zsh
ln -svf ~/.dotfiles/zsh/.zshrc ~

# Cache dir
mkdir -pm 700 ~/.cache
touch ~/.cache/.nobackup

# Python
mkdir -p ~/.cache/pycache

# GnuPG
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
# ln -svf ~/.dotfiles/gnupg/gpg-agent.conf ~/.gnupg/
# ln -svf ~/.dotfiles/gnupg/gpg.conf ~/.gnupg/

# Byobu
# if [ -d "$HOME/.byobu" ]; then
#     ln -svf ~/.dotfiles/byobu/.tmux.conf ~/.byobu/
# fi

# Vim
ln -svf ~/.dotfiles/vim/.vimrc ~
mkdir -p -m 700 ~/.cache/vim
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git \
        ~/.vim/bundle/Vundle.vim
else
    git -C ~/.vim/bundle/Vundle.vim pull
fi
vim +PluginInstall! +qall
