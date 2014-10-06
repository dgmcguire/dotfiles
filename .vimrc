set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'gioele/vim-autoswap'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-surround'
Plugin 'gmarik/vundle'
Plugin 'aklt/vim-substitute'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/greplace.vim'

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

" colorscheme calmar256-dark
colorscheme wombat256mod
" colorscheme railscasts


" shows when you break the 80 column rule
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/"

" removes escape lag
set timeoutlen=1000 ttimeoutlen=0
