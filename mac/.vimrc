set nu
syntax on
autocmd InsertEnter * se cul
autocmd InsertLeave * se nocul
set hlsearch
set incsearch
set ignorecase
filetype on
set showcmd
filetype plugin indent on
execute pathogen#infect() 
