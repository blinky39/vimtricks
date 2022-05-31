syntax on
filetype on
filetype plugin on
filetype indent on
let mapleader = "\<Space>"
let $THEME='nightfly'
set background=dark
" jellybeans onehalfdark onedark nord gruvbox dracula iceberg nightfly everforest
command CFG :e $MYVIMRC
autocmd BufWritePost $MYVIMRC :so $MYVIMRC

" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'lervag/vimtex'
" let g:tex_flavor='latex'
"let g:vimtex_view_method='general'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
" enhancement
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'gilligan/vim-lldb'
" edit
"Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'LunarWatcher/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jayli/vim-easycomplete'
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
" themes
Plug 'itchyny/lightline.vim'
Plug 'cocopon/iceberg.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim'   }
call plug#end()

"-----------------
" plugin settings
"-----------------
nmap <Leader>m <Plug>MarkdownPreviewToggle
noremap <F11> :FloatermSend<CR>
inoremap <F11> <ESC>:FloatermSend<CR>
let g:AutoPairsFlyMode = 1
let g:floaterm_keymap_toggle = '<Leader>f'
let g:floaterm_position = 'bottom'
let g:floaterm_width = 1.0
let g:floaterm_height = 0.4
nnoremap <F1> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
noremap <c-s> <ESC>:UltiSnipsEdit<CR>
imap <c-s> <ESC>:UltiSnipsEdit<CR>
" also use c-j/c-k or tab/s-tab for next/previous suggest
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<c-k>"
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

nnoremap <silent> <C-j> :EasyCompleteNextDiagnostic<CR>
nnoremap <silent> <C-k> :EasyCompletePreviousDiagnostic<CR>
nnoremap <Leader>gr :EasyCompleteReference<CR>
nnoremap <Leader>gd :EasyCompleteGotoDefinition<CR>
nnoremap <Leader>rn :EasyCompleteRename<CR>
nnoremap <Leader>gb :BackToOriginalBuffer<CR>
let g:easycomplete_lsp_checking = 0
let g:easycomplete_tab_trigger="<c-space>"
" diable lsp diagnostics
let g:easycomplete_diagnostics_enable = 0


"-----------------
"     themes
"-----------------
" enable truecolor
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
function Removebg ()
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
endfunction
noremap <silent> <Leader>b :call Removebg()<CR>

colorscheme $THEME
let g:lightline = {
            \ 'colorscheme': $THEME,
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

"-----------------
"     edit
"-----------------
set autoindent
set expandtab
set noswapfile
set numberwidth=1
set shiftwidth=2
set softtabstop=2
set pastetoggle=<F2>
set smarttab
"set splitbelow splitright
set encoding=utf-8
autocmd FileType * setlocal formatoptions-=cro
"set completeopt+=popup
"-----------------
" looks and feel
"-----------------
set mousehide
set number relativenumber
"set noshowcmd
set hlsearch
set ignorecase
set incsearch
set smartcase
set title
set laststatus=2
set wrap
set linebreak
" Give more space for displaying messages.
"set cmdheight=2

"-----------------
"     misc
"-----------------
set autoread
set cin
" Enable autocompletion:
set wildmode=longest,list
set history=1000
set vb t_vb=
set sw=4
set iskeyword+=:
" +clipboard feature is needed
"set clipboard+=unnamed
set shellslash


let c_syntax_for_h=""
let g:netrw_keepdir = 0
let g:netrw_localrmdir='rm -r'
let g:tex_flavor='latex'

"-----------------
" common mappings
"-----------------
" save and quit
nnoremap <silent> <Leader>q :wq<CR>
nnoremap <silent> <Leader><ESC> :q!<CR>
nnoremap <silent> <Leader>w :w<CR>

" jump between {}
noremap <TAB> %
nnoremap <Leader>; $a;<Esc>

" split: horizontal, vertical
nnoremap <silent> <Leader>h :new<CR>
nnoremap <silent> <Leader>v :vnew<CR>
" panel navigation
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" tabs
nnoremap <Leader>t <ESC>:tabe<CR>
nnoremap <Leader>[ <ESC>:tabp<CR>
nnoremap <Leader>] <ESC>:tabn<CR>

" buffer
nnoremap <silent> <Leader>' :ls<CR>
nnoremap <silent> <Leader>, :bp<CR>
nnoremap <silent> <Leader>. :bn<CR>

noremap <Leader>u i_<ESC>r
noremap <a-a> ggVG
noremap <Leader>/ ^i// <ESC> " fast comment cpp
noremap <Leader>\ ^xxxh<ESC> " fast uncomment cpp
nnoremap S :%s//g<Left><Left>

" works in vim
vnoremap <silent> <Leader>y :w !xclip -in -selection clipboard<CR><ESC>

command! Prog :e ~/Documents/programming/
"autocmd FocusLost * redraw!


"---------------------
" programming mappings
"---------------------
"command! LLDB :!clang++ -fsanitize=address -std=c++17 -O0 -g -o "%<" "%" && lldb %<

" use F3 to make
noremap <F3> <ESC> :w <CR> :make %< <CR>
inoremap <F3> <ESC> :w <CR> :make %< <CR>

" F4 python3 run
noremap <F4> <ESC> :w !python3 <CR>

" F5 to run executable
noremap  <F5> <ESC> :!"./%<" < inp<CR>
inoremap <F5> <ESC> :!"./%<" < inp<CR>

function Cppmaps()
    noremap  <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>
    inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>
    " -pthread
    " C++
    " use F9 to debug using LLDB in floaterm
    noremap <F9> <ESC> :w<CR> :!lldb %< <CR>
    inoremap<F9> <ESC> :w<CR> :!lldb %< <CR>
    " use F10 for the same thing but provides a input file named inp.
    noremap <F10> <ESC> :w <CR> :!clang++ -std=c++17 -Wall -O2 -o "%<" "%" && "./%<" < inp<CR>
    inoremap<F10> <ESC> :w <CR> :!clang++ -std=c++17 -Wall -O2 -o "%<" "%" && "./%<" < inp<CR>
endfunction
autocmd BufRead *.cpp :call Cppmaps()

function Cmaps()
    "noremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && ./%< < inp<CR>
    "inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>
    " -pthread
    " C
    " use F9 to debug using GDB in floaterm
    noremap <F9> <ESC> :w<CR> :!gdb %< <CR>
    inoremap<F9> <ESC> :w<CR> :!gdb %< <CR>
    " use F10 for the same thing but provides a input file named inp.
    noremap <F10> <ESC> :w <CR> :!gcc -std=c++17 -Wall -O2 -o "%<" "%" && "./%<" < inp<CR>
    inoremap<F10> <ESC> :w <CR> :!gcc -std=c++17 -Wall -O2 -o "%<" "%" && "./%<" < inp<CR>
endfunction
autocmd BufRead *.c :call Cmaps()
