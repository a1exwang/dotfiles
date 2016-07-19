[ -f /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
