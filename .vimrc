" Enable pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" needed for pathogen to be able to work magic
filetype plugin indent on

syntax on
set ignorecase
" disable mouse
set mouse-=a
" show status line
set laststatus=2
