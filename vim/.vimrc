set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set breakindent
set nowrap
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set termguicolors
set scrolloff=8
set sidescrolloff=10
set updatetime=250
set timeoutlen=1000
set ttimeoutlen=0
set termguicolors
syntax enable

let mapleader = " "
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>f mzgg=G`z


" Move windows with <leader>H/J/K/L
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

" Swap window positions with <leader>'
nnoremap <leader>' <C-w><C-r>
