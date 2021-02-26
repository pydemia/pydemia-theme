" Syntax coloring
if has("syntax")
    syntax on
endif

" One tab to N spaces
set softtabstop=2
set tabstop=2

" <<, >> move
set shiftwidth=2

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

" set <leader> key
let mapleader=","

" set nerdcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '# ' }, 'd': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Set Plugin: Start -----------

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Treeview
Plugin 'scrooloose/nerdtree'
" NERDTree ON Shortcut : "\nt"
map <Leader>nt <ESC>:NERDTree<CR>

" Improved Status bar
Plugin 'vim-airline/vim-airline'

" Check Syntax Error
Plugin 'scrooloose/syntastic'

" Comment functions so powerful
Plugin 'scrooloose/nerdcommenter'

" Set Plugin: End -------------

call vundle#end()            " required
filetype plugin indent on    " required
