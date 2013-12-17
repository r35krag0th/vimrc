
let mapleader=','
let maplocalleader='\\'

" Make syntax highlighting work
syntax on
set nocompatible
filetype off

" Filetype-based indenting logic enabled; with smartindent
filetype on
filetype plugin indent on
set smartindent

" Basic settings
set nolist " Diable listchars (whitespace/newline/etc)
set ignorecase
set complete=.,w,b,t                    " ??????
"set textwidth=80 " Max line length before wrapping
set textwidth=0 " Max line length before wrapping
set nocursorline
set nocursorcolumn
set printoptions=paper:letter
set nobackup
set nowritebackup
set hidden
set modeline
set modelines=5
set autoread
set autowrite
set history=256

set nolazyredraw
set hidden
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Disable Mouse
set mouse=a

" Hide mouse after chars typed
set mousehide

set shortmess=aOtI
set report=0
set scrolloff=5

" Searching / Machines
set showmatch                           " show matching brackets
set smartcase                           " ?
set mat=5                               " how many tenths of a second to blink matching brackets for
set hlsearch                            " Highlight searches
set incsearch                           " BUT do highlight as you type you search phrase

" Line numbers in the gutter
set number
set numberwidth=1
set norelativenumber
set ruler

" BOOP
set noerrorbells
set novisualbell

" Status Line
set wildmenu
set wildmode=full
set statusline=%F%m%r%h%w\ %y\ [\ A(%03.3b)\ .\:.\ H(%02.2B)\ .\:.\ L%04l\ -\ C%04v\ .\:.\ %p%%\ .\:.\ %L\ Length\ ]
set laststatus=2                        " always show the status line

" Text
set formatoptions=tcrqn                            " See Help (complex)
set autoindent                                  " autoindent
set smartindent                                  " smartindent
set cindent                             " do c-style indenting
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
set tabstop=4                           " tab spacing (settings below are just to unify it)
set softtabstop=4                       " unify
set shiftwidth=4                        " unify
set expandtab                           " [05142007: Changed to Pavlov Standards]
set smarttab
set wrap                              " do not wrap lines
set linebreak
set showbreak=">\ "

" Folding
set foldenable                          " Turn on folding
set foldmethod=indent                   " Make folding indent sensitive
set foldopen-=search                    " don't open folds when you search into them
set foldopen-=undo                      " don't open folds when you undo stuff

" Formatting
"" Automatically insert the current comma leader after hitting 'o' or 'O' in normal
set formatoptions+=o

" Do not automatically insert a comment leader after enter
set formatoptions-=r

" Do not auto-wrap text using textwidth (doesn't apply to comments)
set formatoptions-=t

" Visual
set splitbelow
set splitright
set vb t_vb=
set showcmd
set laststatus=2
set noshowmode

if has("autocmd")
    augroup Standard
        au!
        au BufEnter * :syntax sync fromstart  " ensure every file does syntax highlighting (full)
        " au BufWritePre * mark `|:%s/\s\+$//e|normal ``      " kill trailing whitespace at the end of lines before writing.
    augroup END

    augroup makefile
        au!
        au BufNewFile,BufRead Makefile :set fdm=indent
        au BufEnter Makefile set noexpandtab
    augroup END

    augroup gzip
        " Remove all gzip autocommands
        au!

        " Enable editing of gzipped files
        "   read: set binary mode before reading the file
        "   uncompress text in buffer after reading
        "  write: compress file after writing
        " append: uncompress file, append, compress file
        au BufReadPre,FileReadPre  *.gz set bin
        au BufReadPost,FileReadPost  *.gz let ch_save = &ch|set ch=2
        au BufReadPost,FileReadPost  *.gz '[,']!gunzip
        au BufReadPost,FileReadPost  *.gz set nobin
        au BufReadPost,FileReadPost  *.gz let &ch = ch_save|unlet ch_save
        au BufReadPost,FileReadPost  *.gz execute ":doautocmd BufReadPost " . expand("%:r")

        au BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
        au BufWritePost,FileWritePost  *.gz !gzip <afile>:r

        au FileAppendPre     *.gz !gunzip <afile>
        au FileAppendPre     *.gz !mv <afile>:r <afile>
        au FileAppendPost    *.gz !mv <afile> <afile>:r
        au FileAppendPost    *.gz !gzip <afile>:r
    augroup END

    augroup vimrc
        au!
        au BufEnter .vimrc set fdm=indent
    augroup END
endif
