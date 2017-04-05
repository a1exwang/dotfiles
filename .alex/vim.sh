#!/bin/bash
set -xe
cd ~/.vim/bundle/YouCompleteMe
./install.py

cd ~/.vim/bundle/command-t
bundle install
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
