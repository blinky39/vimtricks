syntax on
filetype on
filetype plugin on
filetype indent on
let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
" Plug 'lervag/vimtex'
" let g:tex_flavor='latex'
"let g:vimtex_view_method='general'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'itchyny/lightline.vim'
"Plug 'dylanaraps/wal.vim'
"Plug 'gilligan/vim-lldb'

call plug#end()

"colorscheme wal
colorscheme jellybeans
set background=dark
let g:floaterm_keymap_toggle = '<F12>'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld'  ] ]
      \
      \   },
      \ 'component': {
      \   'helloworld': 'Try Harder!'
      \ 
      \  },
      \ }
" lightline colorschemes:
" OldHope PaperColor Tomorrow apprentice ayu darcula default
" deus jellybeans landscape meteria material molokai nord one powerline
" powerlineish rosepine selenized seoul256 simpleblack solarized
" srcery_drk wombat

let c_syntax_for_h=""
let g:netrw_keepdir = 0
let g:netrw_localrmdir='rm -r'
let g:tex_flavor='latex'
map <c-n> <ESC>:NERDTreeToggle<CR>
set laststatus=2

" save and quit in any mode, alt+w/q
map <a-w> <Esc>:w<CR>
map <a-q> <Esc>:q<CR>

" jump between {}
noremap <TAB> %
" split: horizontal, vertical
nnoremap <silent> <Leader>h :new<CR>
nnoremap <silent> <Leader>v :vnew<CR>

nnoremap <silent> <Leader>q :wq<CR>
nnoremap <silent> <Leader><ESC> :q!<CR>
nnoremap <silent> <Leader>w :w<CR>


" panel navigation
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

noremap <Leader>b ^
noremap <Leader>e <ESC>:e .<CR>
noremap <Leader>r <C-R>
noremap <Leader>u i_<ESC>r
noremap <Leader>n :vs
noremap <Leader>o <C-O>
noremap <Leader>i <C-I>
noremap <Leader>a ggVG
noremap <Leader>/ ^i// <ESC> " fast comment cpp
noremap <Leader>\ ^xxxh<ESC> " fast uncomment cpp
" quick copy to clipboard
vnoremap <silent> <Leader>y :w !xclip -in -selection clipboard<CR><ESC>
noremap <Leader>s :source ~/.vimrc <CR>

command! Prog :e ~/Documents/programming/
"autocmd FocusLost * redraw!
"command! LLDB :!clang++ -fsanitize=address -std=c++17 -O0 -g -o "%<" "%" && lldb %<


autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+17\ \-Wall
autocmd FileType haskell setlocal makeprg=ghci\ %
autocmd FileType python setlocal makeprg=python3\ %
autocmd FileType sh setlocal makeprg=%

" use F3 to make
noremap <F3> <ESC> :w <CR> :make <CR>
inoremap <F3> <ESC> :w <CR> :make <CR>

" F4 python3 run
noremap <F4> <ESC> :w !python3 <CR>

" F5 to run executable
noremap <F5> <ESC> :!./%< < inp<CR>
inoremap <F5> <ESC> :!./%< < inp<CR>

"noremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && ./%< < inp<CR>
"inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>

" -pthread
" C++
" use F9 to debug using LLDB in floaterm
noremap <F9> <ESC> :w<CR> :!lldb %< <CR>
inoremap<F9> <ESC> :w<CR> :!lldb %< <CR>
" use F10 for the same thing but provides a input file named inp.
noremap <F10> <ESC> :w <CR> :!clang++ -std=c++17 -Wall -O2 -o %< % && ./%< < inp <CR>
inoremap<F10> <ESC> :w <CR> :!clang++ -std=c++17 -Wall -O2 -o "%<" "%" && "./%<" < inp<CR>
"set exrc

noremap <F1> <ESC>:tabprev <CR>
vnoremap <F1> <ESC>:tabprev <CR>
inoremap <F1> <ESC>


set autoindent
set autoread
set cin
set expandtab
set history=1000
set hlsearch
set ignorecase
set incsearch
set mousehide
set noswapfile
set pastetoggle=
set smarttab
set vb t_vb=
set sw=4
set iskeyword+=:
set title
set clipboard+=unnamedplus
"set noruler
set number relativenumber
set noshowcmd
set numberwidth=1
set shiftwidth=2
set tabstop=2
set shellslash
