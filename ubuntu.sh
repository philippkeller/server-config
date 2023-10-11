#!/bin/sh

sudo apt update
sudo apt install -y jq build-essential postgresql automake
sudo apt install -y python3-venv ripgrep nodejs npm
sudo npm install -g n

# tmux
sudo apt remove tmux -y # version 3.2 is auto installed
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
export GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
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
sudo apt install neovim -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/swapfiles
source ~/.bashrc
nvim +PluginInstall +qall

# populate bash history with some commands
cat <<EOF >> ~/.bash_history
git commit -am "$(curl -s https://whatthecommit.com/index.txt)"
python3 -m venv venv
git clone --recurse-submodules myrepo
source venv/bin/activate
pip install -r requirements.txt
curl -4 icanhazip.com
sudo -u postgres psql
EOF
