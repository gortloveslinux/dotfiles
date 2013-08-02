set nocompatible
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"==
" Settings
"==
set ignorecase
set smartcase
set noerrorbells
set expandtab
set nowrap
set autoread
set incsearch
set nu
set tabstop=2
set sw=2
set history=1000
set gfn=MonoSpace\ 8
set term=xterm-256color
set guioptions-=m
set guioptions-=T
set guioptions-=r
set wildchar=<Tab> wildmenu wildmode=full
colorscheme desert
syntax on
filetype plugin on
let mapleader = ","
let g:mapleader = ","
call matchadd('ErrorMsg', '\%81v', 100) "Highlight Lines over 80 characters long


"==
" Plugin Settings
"==
let g:syntastic_enable_balloons=1

"==
" Keys Maps
"==
nnoremap <leader>nt :call OpenOrFocusNERDTree()<CR>
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>rl :s/<C-r><C-w>//g<Left><Left>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>tb :TagbarOpen j<CR>
nnoremap <leader>hl :noh<CR>
nnoremap <space> i <Esc>
nnoremap <S-CR> O<Esc>j
nnoremap <CR> o<Esc>k
nnoremap < <<
nnoremap > >>
nnoremap  ;  :
nnoremap  :  ;
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
nnoremap <silent> *   *:call HLNext(0.4)<cr>
nnoremap <silent> #   #:call HLNext(0.4)<cr>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
vnoremap < <gv
vnoremap > >gv

"==
" Functions
"==
"Blink Highlight match
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

"Open Nerdtree, or focus if already open
function! OpenOrFocusNERDTree ()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction
