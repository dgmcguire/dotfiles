set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Plugins
Plugin 'elixir-lang/vim-elixir'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/freeo/vim-kalisi'
Plugin 'kien/ctrlp.vim'
Plugin 'gioele/vim-autoswap'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'aklt/vim-substitute'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/greplace.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'shime/vim-livedown'
Plugin 'vim-scripts/loremipsum'
Plugin 'tpope/vim-vinegar'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

set tabstop=2 shiftwidth=2 expandtab
set relativenumber
set number
syntax on

set t_Co=256

" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

let g:mapleader=","
"ctrlp stuff
" let g:ctrlp_by_filename=1
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"nerdtree
map <leader>d :NERDTree<cr>

" colorscheme calmar256-dark
colorscheme kalisi
set background=dark
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
set timeoutlen=1000 ttimeoutlen=0

" enable per-project .vimrc files
set exrc
" Only execute safe per-project vimrc commands
set secure
" open new window below instead of above
set splitbelow

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" nnoremap <leader>ft :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>  -default-action=tabopen
" nnoremap <leader>fs :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>  -default-action=split
" nnoremap <leader>fv :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>  -default-action=vsplit
" nnoremap <leader>fc :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>

" nnoremap <leader>ft :Unite file -default-action=tabopen
" nnoremap <leader>fs :Unite file -default-action=split
" nnoremap <leader>fv :Unite file -default-action=vsplit
" nnoremap <leader>fc :Unite file

" Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Play nice with supertab
"   let b:SuperTabDisabled=1
"   " Enable navigation with control-j and control-k in insert mode
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

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

" airline config
let g:airline#extensions#tabline#enabled = 1

  " This allows buffers to be hidden if you've modified a buffer.
  " This is almost a must if you wish to use buffers in this way.
  set hidden

  " To open a new empty buffer
  " This replaces :tabnew which I used to bind to this mapping
  nmap <leader>T :enew<cr>

  " Move to the next buffer
  nmap gt :bnext<CR>

  " Move to the previous buffer
  nmap gT :bprevious<CR>

  " Close the current buffer and move to the previous one
  " This replicates the idea of closing a tab
  nmap ZZ :bp <BAR> bd #<CR>

  " Show all open buffers and their status
  nmap <leader>bl :ls<CR>
