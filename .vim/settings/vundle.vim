filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

runtime ruby.vundle
runtime languages.vundle
runtime git.vundle
runtime appearance.vundle
runtime textobjects.vundle
runtime search.vundle
runtime project.vundle
runtime vim-improvements.vundle

filetype plugin indent on
