# vimrc
---
This is my vimrc config for coding.
Welcome to add.

## Usage
```shell
git clone https://github.com/fevin/vimrc.git ~/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/vimrc/.vim/bundle/Vundle.vim
ln -s ~/vimrc/.vim ~/.vim
ln -s ~/vimrc/.vimrc ~/.vimrc

# open vim and install plugin
vim
:PluginInstall
```
---

## tags
`unix` `macOS` `PHP` ...

## Plugin list
* Plugin 'VundleVim/Vundle.vim'
* Plugin 'tpope/vim-fugitive'
* Plugin 'vim-airline/vim-airline' " buttom status line
* Plugin 'vim-airline/vim-airline-themes'
* Plugin 'scrooloose/nerdtree' " tree
* Plugin 'ctrlpvim/ctrlp.vim' " search file
* Plugin 'vim-syntastic/syntastic' " code synstatic
* Plugin 'vim-scripts/taglist.vim' " function list
* Plugin 'Valloric/YouCompleteMe' " auto to complete
* Plugin 'vim-scripts/DoxygenToolkit.vim' " auto to complete
* Plugin 'will133/vim-dirdiff' " dir diff
* Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' } " Fuzzy search file
* Plugin 'artur-shaik/vim-javacomplete2' " java package auto complement

## SyntaxCheck Support
* PHP
* Java

## Other functions
* `()` `{}` `[]` `''` `""` auto complement
