#!/bin/bash

sudo apt -y install software-properties-common

sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt update
sudo apt -y install tmux vim htop g++-8 libstdc++6 cmake

cd ~
git clone --depth=1 https://github.com/JeiKeiLim/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

git clone https://github.com/JeiKeiLim/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

cat >> ~/.inputrc <<'EOF'
"\e[A": history-search-backward
"\e[B": history-search-forward
EOF

echo "bind -f  ~/.inputrc" >> ~/.bashrc

cd $HOME/.vim_runtime/my_plugins \
  && git clone --recursive https://github.com/ycm-core/YouCompleteMe.git \
  && cd YouCompleteMe \
  && CC=gcc-8 CXX=g++-8 python3 install.py --clangd-completer
