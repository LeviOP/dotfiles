" Indentation
set autoindent
set expandtab
filetype indent on
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set list listchars=tab:▸\ ,trail:·

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase
" Clear highlighting on escape in normal mode
" nnoremap <esc> :noh<return><esc>
" nnoremap <esc>^[ <esc>^[

" Text rendering
set display+=lastline
set linebreak
set scrolloff=1
set sidescrolloff=5
syntax enable
set wrap

" UI
set laststatus=2
set ruler
set wildmenu
set tabpagemax=50
set number
set mouse=a
set title
set background=dark

" Other
set backspace=indent,eol,start
set backupdir=~/.cache/nvim
set dir=~/.cache/nvim
set history=1000
set wildignore+=.pyc,.swp
set hidden

" Binds
" Set leader
nnoremap <SPACE> <Nop>
let mapleader=" "
" Buffer navigation
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>
map <leader>D :bd!<cr>
" Create newline without leaving normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" View diff
map <leader>g :w !diff % -<cr>
" Open help in fullscreen
augroup HelpBuffer | au! filetype help only | augroup END
" Clear highlighting
map <leader>h :noh<cr>

" Plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
colorscheme dracula

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = '|'

" Move viminfo
set viminfo+=n~/.config/nvim/viminfo

" Configs
source ~/.config/coc/coc.vim
