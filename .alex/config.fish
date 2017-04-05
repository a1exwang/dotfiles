set -x PATH ~/bin $PATH
set -x PATH ~/.pyenv/bin $PATH
. (pyenv init - | psub)

set -x PATH ~/.rvm/bin $PATH
rvm default

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

alias v vim
alias g git
alias l ls
alias s ls
alias sl ls
alias c cd

