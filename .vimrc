set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'gioele/vim-autoswap'
Bundle 'danro/rename.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-surround'
Bundle 'gmarik/vundle'
Bundle 'aklt/vim-substitute'
Bundle 'JarrodCTaylor/vim-js2coffee'

call vundle#end()
filetype plugin indent on 

set tabstop=2 shiftwidth=2 expandtab
set number
set t_Co=256
syntax on

let g:mapleader=","
"ctrlp stuff
let g:ctrlp_by_filename=1 
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"nerdtree
map <leader>d :NERDTree<cr>

colorscheme calmar256-dark

" shows when you break the 80 column rule
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/"
