" Bob Saska .vimrc redux
" set XXX      <-- global
" setlocal XXX <-- local
"  you can space delimit your settings also

let mapleader=','
let maplocalleader='['
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backups//

" Make syntax highlighting work
let python_highlight_all=1
syntax on
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle/
"set rtp+=~/.vim/bunlde/powerline/bindings/vim

call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"" BUNDLES ------------------------
" Making with the useful and pretty
" Bundle 'https://github.com/Lokaltog/powerline.git'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/sickill/vim-monokai.git'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'LogViewer'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'https://github.com/keith/travis.vim'

" Better folding
Plugin 'tmhedberg/SimpylFold'
"Bundle 'dotfiles'

" Dash App for Vim
" Bundle 'rizzatti/funcoo.vim'
" Bundle 'rizzatti/dash.vim'

" tComment
Bundle "tComment"

" Programming
Bundle "jQuery"
Bundle "https://github.com/mattn/emmet-vim.git"
Bundle "node"
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'


" Python Amazingness
Bundle "https://github.com/davidhalter/jedi-vim.git"
Plugin 'vim-scripts/indentpython.vim'

" Syntax Highlighting
Bundle "Markdown"

" PHPdocumentor
Bundle 'tobyS/pdv'

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
"" END BUNDLES -------------------

" 256-Color Support
set t_Co=256
highlight BadWhitespace ctermbg=red guibg=darkred

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
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" Regular Expression Fun

"  ALWAYS make substitutions global
" set gdefault

" Lots of undo history!
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo
endif


" Theme
" colorscheme oceandeep
set background=dark
" colorscheme solarized
colorscheme monokai

" Searching / Machines
set showmatch                           " show matching brackets
set smartcase                           " ?
set mat=5                               " how many tenths of a second to blink matching brackets for
set hlsearch                            " Highlight searches
set incsearch                           " BUT do highlight as you type you search phrase

" Line numbers in the gutter
set number
set numberwidth=1
if exists("&norelativenumber")
    " relativenumber was introduced in Vim 7.3 - this provides compatibility
    " for older versions of Vim
    setlocal norelativenumber
endif
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
set expandtab                           " tabs preferred over spaces
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

" Default Encoding
set encoding=utf-8

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

" PHPdocumentor Setup
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" Python Jedi for Vim
" (?) Automatically Init with Vim? (default=1)
let g:jedi#auto_initialization = 1

" (?) Automatically init Vim config? (default=1)
let g:jedi#auto_vim_configuration = 1

" (?) Make Jedi-Vim use tabs when going to defs? (default=1)
let g:jedi#use_tabs_not_buffers = 1

" (?) If you like to use splits... (left, right, top, bottom, winwidth)
" let g:jedi#use_splits_not_buffers = "left"

" (?) Jedi automatically starts completion if you type something. (default=1)
let g:jedi#popup_on_dot = 1

" (?) Auto-select the first thing in the menu? (default=1)
let g:jedi#popup_select_first = 1

" (?) Show func signature when in insert mode (in real-time)
"   > 1 = Pop Up in Buffer (default)
"   > 2 = In Vim CmdLine
let g:jedi#show_call_signatures = 1

" Jedi Key Bindings
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>D"
let g:jedi#documentation_command = "<leader>K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" SimpylFold
" ===================================
" Show docstrings for folded code?
let g:SimpylFold_docstring_preview=1


" Syntastic (Syntax Checking for Vim)
" ====================================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_flake8_args='--select=E901,E902,F821,F822,F823,F831'

" AutoCmds
" ==========================
"
" Short-Hand Options
" --------------------------
"  ts = tabstop
"  tw = textwidth
"  sw = shiftwidth
"  fo = formatoptions
"  et = expandtab
" sta = stowtabline
" sts = softtabstop

if has("autocmd")
    augroup Standard
        au!
        au BufEnter * :syntax sync fromstart  " ensure every file does syntax highlighting (full)
        " au BufWritePre * :mark `|:%s/\s\+$//e|normal ``      " kill trailing whitespace at the end of lines before writing.
        au BufWritePre * :%s/\s\+$//e
        au BufReadPre,FileReadPre *.pp set ft=puppet
        autocmd vimenter * if !argc() | NERDTree | endif
    augroup END
    augroup Python
        au!
        " au FileType python :set ai sw=4 ts=4 sta et fo=croql fdm=indent foldlevel=99
        au BufRead,BufNewFile *.py,*.pyw,*.c,*.h :match BadWhitespace /\s\+$/
        au BufRead,BufNewFile *.py,*.pyw,*.c,*.h :match BadWhitespace /\t/
        au BufNewFile,BufRead *.py :set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
        " au BufWritePre *.py :retab
    augroup END
    augroup FullStack
        au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2
    augroup END
    augroup JSON
        au!
        au BufEnter *.json :set sw=2 ts=2 sts=2 sta et fo=croql
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
    augroup extra_extensions
        au!
        au BufEnter *.pp set ft=puppet
        au BufEnter named.conf.local set ft=named
        au BufEnter named.conf.options set ft=named
        au BufEnter named.conf set ft=named
        au BufEnter *.zone set ft=bindzone
        au BufEnter /etc/icinga2/conf.d/* set ft=icinga
    augroup END
endif

" Split Window Management
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

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

" Make the tab key dual purpose.
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

" Toggle between numbers and relative numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

if v:version < 704
    nnoremap <silent> <leader>n :call NumberToggle()<cr>
else
    set relativenumber
    set number
endif

" toggle paste/nopaste modes
nnoremap <silent> <Leader>p :set paste! paste?<CR>

" Special Python Stuff
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"
" POWERLINE
"

" Conditionally include Powerline for Vim if the files actually exist.
" let g:powerline_python_vim = '/Library/Python/2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/plugin/powerline.vim'
let g:powerline_python_vim = '/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim'

if filereadable(powerline_python_vim)
    python import powerline.bindings.vim
    exec ":source " . g:powerline_python_vim
endif
