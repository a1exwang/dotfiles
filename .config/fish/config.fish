setxkbmap -option caps:escape
xset r rate 200 30

set -x HADOOP_HOME "/usr/local/hadoop-2.8.1"
set -x GOPATH "$HOME/.go"
set -x PATH "$HOME/.pyenv/bin" $PATH
set -x PATH "$HADOOP_HOME/bin" $PATH
set -x PATH "$HOME/bin" $PATH
set -x GOPATH "$HOME/.go"
set -x GOROOT $HOME/go
set -x PATH "$GOPATH/bin" $PATH
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=(tty)
gpgconf --launch gpg-agent
#set -x SSH_AUTH_SOCK "~/.gnupg/S.gpg-agent.ssh"
set -x WTF_DB_PATH "$HOME/dev/proj/wtf_you_must_know"

# For pyenv
set -gx PATH '/home/alexwang/.pyenv/shims' $PATH
set -gx PYENV_SHELL fish
. '/home/alexwang/.pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    . (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end


function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

#thefuck --alias | source

alias v vim
alias g git
alias sl ls
alias lslslslslslslslslslsls ls
alias s ls
alias l ls
alias c cd 
alias g git
alias gc "git commit"
alias yoursql mycli
alias yoursqlro mycli
alias yoursqldump mysqldump
alias yoursqlimport mysqlimport
alias manage-prod-shell "python manage.py shell --settings=conf.production.settings"
alias manage-test-shell "python manage.py shell --settings=conf.testing.settings"
alias , "cd .."
alias gpg gpg2
#rvm default
