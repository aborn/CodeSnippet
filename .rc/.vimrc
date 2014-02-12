syntax on  
set nu  
set showmatch  
set ts=4  
set softtabstop=4  
syntax enable  
syntax on  
set cursorline  
  
if &term=="xterm"  
    set t_Co=8  
    set t_Sb=^[[4%dm  
    set t_Sf=^[[3%dm  
endif  
  
"indent based on file type  
filetype indent plugin on  
filetype on  
  
set autoindent   
set smartindent   
set ruler  
  
"show command in bottom   
set showcmd  
  
set shiftwidth=4  
set hlsearch  
set encoding=utf-8   
set fileencodings=ucs-bom,utf-8,cp936
