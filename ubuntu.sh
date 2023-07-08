#!/bin/sh
sudo apt update
sudo apt install -y jq build-essential postgres automake

# tmux
sudo apt remove tmux # version 3.2 is auto installed
sudo apt install -y libevent-dev ncurses-dev build-essential bison pkg-config
cd /var/tmp/
wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar -xzvf tmux-3.3a.tar.gz
cd tmux-3.3a/
./configure
make && sudo make install

cd /var/tmp/
git clone https://github.com/philippkeller/tmux-config.git
./tmux-config/install.sh   

# code and environment
cd ~
git clone git@github.com:philippkeller/server-config.git
rm -f .vimrc
ln -s server-config/.vimrc
rm -f .ripgreprc
ln -s server-config/.ripgreprc
rm -f .bashrc
ln -s server-config/.bashrc
rm -f .gitconfig
ln -s server-config/.gitconfig
rm -rf .config
ln -s server-config/.config
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/swapfiles
source ~/.bashrc
nvim +PluginInstall +qall
