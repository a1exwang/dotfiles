" alex's .vimrc file
" Use Pathogen to manager plugins
execute pathogen#infect()

filetype plugin indent on    " required

set tabstop=2
set shiftwidth=2
set softtabstop=0 expandtab
syntax on
set backspace=indent,eol,start
set hlsearch
set showcmd
set number
set nofoldenable    " disable folding

" For plugin command-t
let g:CommandTMaxFiles=2000000

" NERDTree
map <C-n> :NERDTreeToggle<CR>
