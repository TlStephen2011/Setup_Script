#! /bin/bash

#grab oh-my-zsh
-c curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
#setup .vimrc
echo "set nu\nset relativenumber\nset mouse=a\nset autoindent\nsyntax on" > ~/.vimrc && source ~/.vimrc
#add z to .zshrc
awk 'plugins=( { print; print "\nz"; next }1' ~/.vimrc && source ~/.zshrc
#get ssh key and copy it clipboard
ssh-keygen
ls ~/.ssh
eval `ssh-agent`
ssh-add -K ~/.ssh/id_rsa
echo "Host *\n\tUseKeychain yes" > ~/.ssh/config
pbcopy < ~/.ssh/id_rsa.pub
echo "SSH key copied. Enter it on bitbucket.com\n"
