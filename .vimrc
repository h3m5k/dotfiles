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
" Open tabs when switching buffers. to the existing tab if the buffer is open, or creating a new one if not
set switchbuf=usetab,newtab

" COLORS!
" enable 256 colors
set t_Co=256

" MOLOKAI
let g:molokai_original = 1
colorscheme molokai

" SOLARIZED
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" SYNTASTIC SETTINGS
" recommended defaults
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"" modemap settings
"let g:syntastic_mode_map = {
"    \ "mode": "active",
"    \ "active_filetypes": ["puppet", "php", "sh", "python"],
"    \ "passive_filetypes": ["ruby"] }

