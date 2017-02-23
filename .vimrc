" alex's .vimrc file
" Use Pathogen to manager plugins
execute pathogen#infect()

filetype plugin indent on    " required

""""""""""""""""""" Basic stuff
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
set background=dark
set incsearch
set wildmenu
set relativenumber

""""""""""""""""" Custom Mappings
" gc: swap current character with the next one
nnoremap <silent> gc xph
" gw: swap current word with the next one
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
" gl: swap current word with the last one
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
" gr: push the word right
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
" K: push the line up
nnoremap <silent> K ddkkp
" J: push the line down
nnoremap <silent> J ddp

map gn :bn<cr>
map gp :np<cr>

"""""""""""""""""" Scripts
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

""""""""""""""""" Plugins Configurations
" For plugin command-t
let g:CommandTMaxFiles=2000000
" Prevent Command-t from searching .git
let g:CommandTTraverseSCM = '/home/alexwang/find_croot'

" For YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" NERDCommentor
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" Toggle comment
map <C-_> <leader>c<space>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Press Enter to remove search highlight
nnoremap <ENTER> :nohlsearch<cr>

" Press Command-x to toggle Tagbar
nmap <Leader>x :TagbarToggle

