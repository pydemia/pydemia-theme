" Syntax coloring
if has("syntax")
    syntax on
endif

" One tab to 4 spaces
set softtabstop=4
set tabstop=4

" <<, >> move
set shiftwidth=4

" tab to space
set expandtab

" Indentation
set autoindent
set cindent

" Show line numbers
" set nu

" Shortcut
map <F3> "+Y
map <F4> +gP
vmap <F3> "+y
vmap <F4> "+gP
imap <F4> <ESC> "+gPi
map <F2> :NERDTreeToggle<CR>
nmap <F8> :Tlist<CR>

" Show status bar
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" Vundle Setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Set Plugin: Start -----------

" Treeview
Plugin 'scrooloose/nerdtree'
" NERDTree ON Shortcut : "\nt"
map <Leader>nt <ESC>:NERDTree<CR>

" Improved Status bar
Plugin 'vim-airline/vim-airline'


" Check Syntax Error
Plugin 'scrooloose/syntastic'
" Set Plugin: End -------------

call vundle#end()            " required
filetype plugin indent on    " required
