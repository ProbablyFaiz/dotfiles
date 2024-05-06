#!/bin/bash

# Prompt the user for their password
read -s -p "Enter password for user faiz: " password
echo

# Update and install necessary packages
sudo apt update
sudo apt install fish libevent-dev ncurses-dev build-essential bison pkg-config gcc -y

# Python 3.10 installation
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.10 python-is-python3 -y python3-pip python3-venv

# Tmux & Vim setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim

# Dotfiles setup
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare https://github.com/ProbablyFaiz/dotfiles.git $HOME/.cfg
config checkout

# Install tmux and lsd
mkdir ~/dl
cd ~/dl
wget https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz
tar xvf tmux-3.4.tar.gz
cd tmux-3.4
./configure
make && sudo make install
wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-musl_1.0.0_amd64.deb
sudo dpkg -i lsd-musl_1.0.0_amd64.deb

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Change shell to fish
sudo chsh -s $(which fish) $(whoami)

# Disable password for sudo
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

# Install the vim plugins
vim +PlugInstall +qall

# Install the tmux plugins
bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Tell the user to logout and login
echo "Setup done! Log out and log back in to finish setup."

