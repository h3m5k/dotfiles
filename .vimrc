" enter the current millenium
" must be first, because it changes other options as a side effect
set nocompatible

" Enable pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" needed for pathogen to be able to work magic
filetype plugin indent on

syntax on
set ignorecase
set autoindent
set noswapfile
" dont continue with comment after enter in insert or o/O
set formatoptions-=cro

" default to hybrid line numbers
set number
set relativenumber

" enable absolute line no toggle
function! RelNumberToggle()
  if(&relativenumber == 1)
    set relativenumber !
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call RelNumberToggle()<cr>

" disable mouse
set mouse-=a

" show status line
set laststatus=2
