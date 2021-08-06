set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged') " https://github.com/junegunn/vim-plug
Plug 'vim-airline/vim-airline' " buttom status line
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }

Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'vim-syntastic/syntastic' " code synstatic

" tagbar
Plug 'majutsushi/tagbar'

" python3 ./install.py --clang-completer --go-completer --ts-completer --java-completer
Plug 'Valloric/YouCompleteMe' " auto to complete

Plug 'vim-scripts/DoxygenToolkit.vim' " auto to complete
Plug 'vim-scripts/gtags.vim' " auto to complete
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " Fuzzy search file
" Plug 'ctrlpvim/ctrlp.vim' " search file in global
Plug 'artur-shaik/vim-javacomplete2' "  java package auto complement
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" go
Plug 'fatih/vim-go'
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'

" A Git wrapper
Plug 'tpope/vim-fugitive'

call plug#end()

" {{{ vundle
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'vim-airline/vim-airline' " buttom status line
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'scrooloose/nerdtree' " tree
" Plugin 'ctrlpvim/ctrlp.vim' " search file
" Plugin 'vim-syntastic/syntastic' " code synstatic
" Plugin 'vim-scripts/taglist.vim' " function list
" Plugin 'Valloric/YouCompleteMe' " auto to complete
" Plugin 'vim-scripts/DoxygenToolkit.vim' " auto to complete
" Plugin 'will133/vim-dirdiff' " dir diff for commond-mode eg:DirDiff
" Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' } " Fuzzy search file
" Plugin 'artur-shaik/vim-javacomplete2' "  java package auto complement
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" call vundle#end()            " required
" }}}

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set nocp

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

" 插入时，智能匹配
set completeopt=menu " code complate
set clipboard+=unnamed " share clipboard

set tabstop=4 " tab 4
set hlsearch " search light
set incsearch " search light word

set enc=utf-8

let g:ackprg = 'ag --nogroup --nocolor --column' " ag searcher

" 设置 find/sfind 查找路径
set path=$PWD/**
" 将缓冲区作为参考点，可用 %% 展开为当前缓冲区路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" 按键映射 - 缓冲区遍历 前后 首尾
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 空格滚屏
map <space> <c-e>j

" YouCompleteMe 报错
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 查询忽略大小写
set ignorecase

" 解决 vim 报错 Error detected while processing function <SNR>51_Tlist_Refresh_Folds
set shell=/bin/sh

" 切换缓冲区时，避免提示保存
set hidden

""""""""""""
" taglist
""""""""""""
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Show_One_File = 1    " 只显示当前文件
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_php_settings = 'php;c:classes;i:interfaces;d:const;f:func'
" taglist 默认跳转到第一个匹配项的问题
map <c-]> g<c-]>
map <silent> en :NERDTreeTabsToggle<CR>
map <silent> em :TagbarToggle<CR>

map gb :Git blame<CR>

" unix
set fileformats=unix,dos

" 高亮多余的空白字符及 Tab
" highlight RedundantSpaces ctermbg=red guibg=red " 多余空白符背景色
" match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

set list                     " 显示Tab符，
set listchars=tab:>-,trail:- " Tab 符号 显示为 >--

" 缩进
set autoindent              " 设置自动缩进
set sw=4                    " 每行缩进的空格数
set ts=4                    " tabstop 一个 tab 四个空格
set expandtab               " 是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>

set backspace=2             " 设置退格键可用
" set mouse=a                 " 鼠标可用
set ve=block                " 光标可以定位在没有实际字符的地方

" 再次打开文件，光标定位在上次退出的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 补全字典
set dictionary-=./tags dictionary+=./tags

" php file
au FileType php call AddPHPWordList()
function AddPHPWordList()
    set dictionary-=$HOME/.vim/dict/php_wordlist.txt dictionary+=$HOME/.vim/dict/php_wordlist.txt
    set complete-=k complete+=k
endfunction

" dir diff config
let g:DirDiffExcludes = "tags,.*.swp"

" gf file-ext use commond:gf or CTRL_W_N to edit file
set suffixesadd+=.class.php

" java
au FileType java setlocal omnifunc=javacomplete#Complete

" auto complement () {} [] ...
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
    else
                return a:char
    endif
endfunction

" go tarbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" go func def info 显示声明信息
map <silent> [d :GoInfo<CR>

au FileType go set nolist                     " 显示Tab符，

" C++
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/conf/.ycm_extra_conf.py'

let NERDTreeShowBookmarks=1 " 默认显示书签

au BufRead,BufNewFile *.json.* set filetype=json " 扩展 json 文件识别方式
au BufRead *.cava setf java

" temporary fix
" https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

" format json
map <F4> <Esc>:%!python -m json.tool<CR>

" tags
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" leaderf
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutB = "<leader>bb"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex,
" append the result to previous search results.
" noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>

" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>

" goto define
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <C-]> :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>

noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

let g:Lf_RgConfig = [
        \ "--hidden"
    \ ]

noremap <Leader>gr :<C-U><C-R>="LeaderfRgInteractive"<CR><CR>
noremap <Leader>fc :<C-U><C-R>="LeaderfFunction"<CR><CR>
noremap <Leader>fl :<C-U><C-R>="LeaderfLine"<CR><CR>
" search word under cursor in *.h and *.cpp files.
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp", expand("<cword>"))<CR>
" the same as above
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,cpp}", expand("<cword>"))<CR>

" search word under cursor in cpp and java files.
" noremap <Leader>b :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -t java", expand("<cword>"))<CR>

" search word under cursor in cpp files, exclude the *.hpp files
noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp", expand("<cword>"))<CR>

" create gtags
" Leaderf gtags --update
"
au BufNewFile,BufRead *.flow set filetype=sql
