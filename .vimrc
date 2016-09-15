" alex's .vimrc file
" Use Pathogen to manager plugins
execute pathogen#infect()

filetype plugin indent on    " required

" Basic stuff
set tabstop=2
set shiftwidth=2
set softtabstop=0 expandtab
syntax on
set backspace=indent,eol,start
set hlsearch
set showcmd
set number
set nofoldenable    " disable folding

set shell=bash

" Rename file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Press Enter to remove search highlight
nnoremap <ENTER> :nohlsearch<cr>

" For plugin command-t
let g:CommandTMaxFiles=2000000
" Prevent Command-t from searching .git
let g:CommandTTraverseSCM = '/home/alexwang/find_croot'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" NERDCommentor
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
map <C-m> <leader>c<space>
