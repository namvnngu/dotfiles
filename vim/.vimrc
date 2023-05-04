"""""""""""
" OPTIONS "
"""""""""""
syntax on

filetype plugin indent on

let mapleader = " "

set viewoptions-=curdir
set backspace+=nostop

set breakindent
set clipboard=unnamed
set completeopt=menu,menuone,noselect
set copyindent
set expandtab
set fileencoding=utf-8
set history=100
set ignorecase
set infercase
set laststatus=3
set linebreak
set number
set preserveindent
set pumheight=100
set relativenumber
set scrolloff=8
set shiftwidth=2
set showtabline=2
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeoutlen=500
set noundofile
set updatetime=300
set virtualedit=block
set nowrap
set nowritebackup
set autoread
set hlsearch
set incsearch
set colorcolumn=80
set noswapfile
set nobackup
set fillchars+=eob:\ ,

""""""""""""
" MAPPINGS "
""""""""""""

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>')
nnoremap <leader>k :wincmd k<CR>')
nnoremap <leader>l :wincmd l<CR>')

nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>

nnoremap <leader>qq :q<CR>

nnoremap <leader>ay :%y+<CR>

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>ba :bufdo bd<CR>
nnoremap <leader>be :%bd\|e#<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Yank til the end
nnoremap Y y$

" Keeping it centered and stable
nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz')
nnoremap <C-u> <C-u>zz')

" Quicklist
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>K :lnext<CR>zz
nnoremap <leader>J :lprev<CR>zz

" Keybindings for tab navigation with leader and number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Toggle spelling checker
map <F4> :setlocal spell! spelllang=en_us<CR>

" Replace currently selected text with default register without yanking it
xnoremap <leader>p "_dP

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" This is going to get me cancelled
inoremap <C-c> <Esc>

" Replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Make file executable
noremap <silent> <leader>x :!chmod +x %<CR>

""""""""""""""""
" AUTOCOMMANDS "
""""""""""""""""
autocmd VimEnter * hi! Normal ctermbg=NONE guibg=NONE
autocmd VimEnter * hi! NonText ctermbg=NONE guibg=NONE

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()