call plug#begin()
Plug 'fatih/vim-go'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'crusoexia/vim-monokai'
Plug 'elubow/cql-vim'
Plug 'tpope/vim-classpath'
Plug 'freitass/todo.txt-vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'majutsushi/tagbar'
call plug#end()


"==
" Plugin Settings
"==
let g:go_fmt_command = "goimports"
let g:syntastic_check_on_open = 1
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"      \ 't' : 'ctype',
"      \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"      \ 'ctype' : 't',
"      \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
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
    \]
\}

"==
" Settings
"==
set path+=**
set shell=bash
set dir=/tmp
set smartcase
set noerrorbells
set expandtab
set nowrap
set autoread
set showmode
set relativenumber
set nu
set tabstop=2
set sw=2
set history=1000
set wildchar=<Tab> wildmenu wildmode=full
"set foldmethod=manual
"set foldcolumn=2
let mapleader = ","
let g:mapleader = ","
set laststatus=2
set term=screen-256color
colorscheme monokai


"==
" Keys Maps
"==
nnoremap <leader>nt :call OpenOrFocusNERDTree()<CR>
nnoremap <leader>ct :NERDTreeClose<CR>

nnoremap <leader>ss :setlocal spell!<cr>

nnoremap <space> i <Esc>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

nnoremap  ;  :
nnoremap  :  ;

nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

inoremap jk <Esc>

nnoremap fh :bprev<CR>
nnoremap fl :bnext<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

nnoremap <leader>ln :lne<CR>
nnoremap <leader>lp :lp<CR>

"execute buffer
nnoremap <leader>2 :@"<CR>
vnoremap <leader>2 y:@"<CR>

inoremap <silent> date<Tab> <C-R>=strftime("%Y-%m-%d")<CR>

"==
" Commands
"==
command! W w !sudo tee % > /dev/null

"==
" Functions
"==
function! OpenOrFocusNERDTree()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction

command! Notes call Notes()
function! Notes()
  if (empty($NOTES_DIR))
    echoerr "NOTES_DIR not set. Can't find notes."
    return 0
  endif
  cd $NOTES_DIR
  e todo/todo.txt
endfunction


"==
" Auto commands
"==
augroup fileType
  autocmd!
  au FileType go nmap <buffer> <leader>t <Plug>(go-test)
  au FileType markdown setlocal ts=4 sw=4
  "au FileType php setlocal tabstop=4 sw=4
augroup END
