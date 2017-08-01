set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline' " buttom status line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree' " tree
Plugin 'ctrlpvim/ctrlp.vim' " search file
Plugin 'vim-syntastic/syntastic' " code synstatic
Plugin 'vim-scripts/taglist.vim' " function list
Plugin 'Valloric/YouCompleteMe' " auto to complete

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on " syn light
set nu " line num
autocmd InsertLeave * se nocul " now line light
autocmd InsertEnter * se cul " same 
set ruler " ruler
set showcmd
set laststatus=1
set foldenable " allow fold
colorscheme monokai " colerscheme

" keyboard
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

set completeopt=preview,menu " code complate
set clipboard+=unnamed " share clipboard

set tabstop=4 " tab 4
set hlsearch " search light
set incsearch " search light word

set enc=utf-8

let g:ackprg = 'ag --nogroup --nocolor --column' " ag searcher

" NERDTree
map <silent> en :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1 " 默认显示书签

" taglist
map <silent> em :TlistToggle<CR>
let Tlist_Show_One_File = 1  " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1  " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1  " 在右侧窗口中显示taglist窗口

" 设置 find/sfind 查找路径
set path=$PWD/**
" 将缓冲区作为参考点，可用 %% 展开为当前缓冲区路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" 按键映射 - 缓冲区遍历 前后 首尾
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" tab
set expandtab
set tabstop=4

" 空格滚屏
map <space> <c-e>j
