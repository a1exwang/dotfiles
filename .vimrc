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

let mapleader = ","

" Remember last cursor position after exiting
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Do not clear clipboard after exiting/suspending
autocmd VimLeave * call system("xsel -ib", getreg('+'))
nnoremap <C-z> :call MyOnExit() <CR><C-z>

function! MyOnExit()
  " if strlen(getreg('+')) > 0
  call system("xsel -ib", getreg('+'))
endfunction

" Resolves the bug ^[[O !!!
" Add save-on-focus-lost feature
" https://github.com/tmux-plugins/vim-tmux-focus-events/issues/2
function! MyFocusLost()
  silent redraw!
  " wa
endfunction
au FocusLost * call MyFocusLost()

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

command W w !sudo tee % > /dev/null
" command C w !sudo tee % > /dev/null <bar> q!

""""""""""""""""" Emacs Keybindings in insert mode
" insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-p> <Up>
imap <C-n> <Down>

imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill_line()<CR>
" imap <C-w> ??? We don't need this because vim already has it.

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
" For plugin auto-ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']

" For plugin command-t
let g:CommandTMaxFiles=2000000
" Prevent Command-t from searching .git
let g:CommandTTraverseSCM = '/home/alexwang/find_croot'

" For YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '/home/alexwang/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <C-h> :YcmCompleter GoTo<cr>
nnoremap <C-j> :YcmCompleter GoToImplementationElseDeclaration<cr>
nnoremap <C-k> :YcmCompleter GoToInclude<cr>
nnoremap <C-l> :YcmCompleter GetType<cr>


" For python-mode
let g:pymode_python = 'python3'
map <C-g> :RopeGotoDefinition<CR>
let g:pymode_rope_goto_def_newwin = 1

" For vim-yankstack
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

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

let g:ConqueGdb_Disable = 1
