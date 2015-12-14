#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/elixir-lang/vim-elixir.git ~/.vim/bundle/vim-elixir
