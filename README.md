drupal-vim
==========

Vim plugins used daily for writing Drupal modules

Installation goes something like this:
```
cd ~/
cp ~/.vimrc ~/.vimrc.local
rm -R ~/.vim
git clone git@github.com:jalama/drupal-vim.git
ln -s ~/drupal-vim/ ~/.vim
ln -s drupal-vim/vimrc ~/.vimrc
cd drupal-vim
git submodule init
git submodule update
vim +BundleInstall +qall
```
