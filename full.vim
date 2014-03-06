" Bob Saska .vimrc redux
" set XXX      <-- global
" setlocal XXX <-- local
"  you can space delimit your settings also

let mapleader=','
let maplocalleader='\\'

" Make syntax highlighting work
syntax on
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
"set rtp+=~/.vim/bunlde/powerline/bindings/vim

call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"" BUNDLES ------------------------
" Making with the useful and pretty
Bundle 'https://github.com/Lokaltog/powerline.git'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
"Bundle 'dotfiles'

" Dash App for Vim
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" tComment
Bundle "tComment"

" Programming
Bundle "jQuery"
Bundle "https://github.com/mattn/emmet-vim.git"
Bundle "node"

" Syntax Highlighting
Bundle "Markdown"

" Git
Bundle "vim-github-dashboard"
Bundle "gitignore"

" Stuff
Bundle "Crunch"
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/kien/ctrlp.vim.git'
"" END BUNDLES -------------------

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

"set guifont=Source\ Code\ Pro:h16
set guifont=Source\ Code\ Pro\ for\ Powerline:h16

" Regular Expression Fun

"  ALWAYS make substitutions global
" set gdefault

" Lots of undo history!
set undofile
set undodir=~/.vim/undo

" Theme
" colorscheme oceandeep
set background=dark
colorscheme solarized

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

" FuzzyFinder config
let g:fuf_modesDisable = []
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR>
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR>

" AutoCmds
if has("autocmd")
    augroup Standard
        au!
        au BufEnter * :syntax sync fromstart  " ensure every file does syntax highlighting (full)
        au BufWritePre * mark `|:%s/\s\+$//e|normal ``      " kill trailing whitespace at the end of lines before writing.
        autocmd vimenter * if !argc() | NERDTree | endif
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

" Abbrs

iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" fix these perl typos
ab prnt print
ab wran warn
ab prnit print

" substitute these typos for what I DWIM'd
cabbrev Wq wq
cabbrev Prel perl
cabbrev prel perl
cabbrev Perl perl
cabbrev pelr perl
cabbrev peerl perl

" like :wq except write and suspend
""command Wst w <bar> st
""cabbrev wst Wst

" NERDTree
map <S-t> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'

" this puts our search term in the middle of the screen
nmap n nmzz.`z
nmap N Nmzz.`z
nmap * *mzz.`z
nmap # #mzz.`z
nmap g* g*mzz.`z
nmap g# g#mzz.`z

" Fixing Keys
" -- Real tabs!
noremap <tab> <nop>

" -- No arrows
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" -- remap parentheses operator to p
onoremap p i(

nnoremap / /\v
vnoremap / /\v
nnoremap ? /\v
vnoremap ? /\v

nnoremap <leader><space> :noh!<cr>

" Make the tab kay dual purpose.
function! InsertTabWrapper()
    " Where is the cursor on the current line?
    let col = col(".") - 1

    " 0 is BOL; use tab // Get the character before the... yeah.  BOOM
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

" Map the function to tab
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

"python from powerline.bindings.vim import source_plugin; source_plugin()
python import powerline.bindings.vim
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim
source /Library/Python/2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/plugin/powerline.vim

