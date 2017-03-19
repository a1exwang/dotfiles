function peco_select_history
  echo (commandline -b)
  history | grep (commandline) | percol $peco_flags | read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
