let mapleader=","
set nocompatible
set autoindent
set smartindent
set showmatch
set ignorecase
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set history=1024
set autochdir
set ruler 
set fileencodings=utf-8
set tenc=utf-8
set hlsearch
set guifont=Consolas:h12:cANSI
colorscheme desert

syntax on
syntax enable

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules/*
let g:ctrlp_custom_ignore='node_modules'


call plug#begin('D:\Program Files\Vim\vim82\plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'

call plug#end()

map <leader>f :NERDTreeToggle<CR>
map H 0
map L $
map <C-J> 10<C-E>
map <C-K> 10<C-Y>
nmap <C-S> :w!<CR>
imap <C-S> <Esc>:w!<CR>



function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !phpctags -R
    endif
    execute ":cd " . curdir
endfunction

nmap <leader>c :call UpdateCtags()<CR>


