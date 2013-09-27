drupal-vim
==========

Vim plugins used daily for writing Drupal modules

Installation goes something like this

cd ~/

cp ~/.vimrc ~/.vimrc.local

ln -s drupal-vim/vimrc ~/.vimrc

cd drupal-vim

git submodule init

git submodule update

vim +BundleInstall +qall
