set nocompatible              " be iMproved
filetype off                  " required!
runtime macros/matchit.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'stephpy/vim-yaml'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanmorillo/excel.vim'
Plugin 'gmarik/vundle'
Plugin 'lambdatoast/elm.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/freeo/vim-kalisi'
Plugin 'kien/ctrlp.vim'
Plugin 'gioele/vim-autoswap'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'aklt/vim-substitute'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'shime/vim-livedown'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

"airline stuff
let g:airline_inactive_collapse=1
let g:airline_section_b = '%f'
let g:airline_section_c = '%t'

set tabstop=2 shiftwidth=2 expandtab
set relativenumber
set number
syntax on

set t_Co=256

" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" remove unwanted whitespace with f5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let g:mapleader=","
"ctrlp stuff
" let g:ctrlp_by_filename=1
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

"nerdtree
map <leader>d :NERDTree<cr>

" colorscheme calmar256-dark
colorscheme kalisi
set background=light
" colorscheme sonoma
" colorscheme railscasts
" colorscheme liquidcarbon
" colorscheme blacklight
" colorscheme wombat
" colorscheme gruvbox

" text search stuff
set incsearch
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

cnoremap <leader>w <C-F>

" tmux copy/paste stuff?

set clipboard=unnamed

" shows when you break the 80 column rule
highlight OverLength ctermbg=black ctermfg=white guibg=#592929
match OverLength /\%121v.\+/"

" removes escape lag
set nottimeout

" enable per-project .vimrc files
set exrc
" Only execute safe per-project vimrc commands
set secure
" open new window below instead of above
set splitbelow

" window management
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-I> :ZoomToggle<CR>

map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

map <leader>wc :wincmd q<cr>
map <leader>wr <C-W>r

map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

nmap <leader><left>  :3wincmd <<cr>
nmap <leader><right> :3wincmd ><cr>
nmap <leader><up>    :3wincmd +<cr>
nmap <leader><down>  :3wincmd -<cr>

" move by visual lines, not by wrapped lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" silver searcher options
let g:ag_highlight=1
let g:ag_mapping_message=0

  " This allows buffers to be hidden if you've modified a buffer.
  " This is almost a must if you wish to use buffers in this way.
  set hidden

" copy file path into buffer
:nmap cp :let @* = expand("%:p")
