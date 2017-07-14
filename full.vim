" Bob Saska .vimrc redux
" Nobody like junky compat mode ;)
set nocompatible

" Find the python binary from the environment
function! WhichPython()
    " Essentially
    " ==============================================
    " If PyEnv is installed use `pyenv which python`
    " Otherwise use `which python`
    return system('([ ! -z "$(which pyenv)" ] && pyenv which python) || which python')
endfunction

" Set the RunTime Path for Vim
if has('nvim')
    " (NeoVim) Figure out which python to use via Env
    let g:python_host_prog=WhichPython()

    " (NeoVim) Set RTP accordingly
    set rtp+=~/.config/nvim/.vim

    "dein Scripts-----------------------------
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/home/ubuntu/.vim/dein/repos/github.com/Shougo/dein.vim

    " Required:
    if dein#load_state('/home/ubuntu/.vim/dein')
        call dein#begin('/home/ubuntu/.vim/dein')

        " Let dein manage dein
        " Required:
        call dein#add('/home/ubuntu/.vim/dein/repos/github.com/Shougo/dein.vim')

        " Add or remove your plugins here:
        call dein#add('Shougo/neosnippet.vim')
        call dein#add('Shougo/neosnippet-snippets')
        call dein#add('Shougo/deoplete.nvim')
        call dein#add('zchee/deoplete-jedi')
        call dein#add('Valloric/YouCompleteMe')

        " You can specify revision/branch/tag.
        call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

        " Required:
        call dein#end()
        call dein#save_state()
    endif

    " Required:
    filetype plugin indent on
    syntax enable

    " If you want to install not installed plugins on startup.
    if dein#check_install()
     call dein#install()
    endif

    "End dein Scripts-------------------------
endif
set rtp+=~/.vim/bundle/Vundle.vim


" ================ General Config ====================
set number                      "    (nu) Enable Line numbers
set backspace=indent,eol,start  "    (bs) Influences the working of <BS>,<Del>,<C>W,<C>U
                                "         + indent | allow backspacing over autoindent
                                "         + eol    | allow backspacing over line breaks (join lines)
                                "         + start  | allow backspacing over the start of insert
set numberwidth=1               "   (nuw) Min number of cols for line numbers
set ruler                       "    (ru) Show Line, Col information
set history=1000                "   (his) Keep a bunch of command history
set showcmd                     "    (sc) Show incomplete commands at the bottom
set noshowmode                  " (nosmd) Do not show the mode at the bottom
set guicursor=a:blinkon0        "   (gcr) Disable Cursor Blink
set noerrorbells                "  (noeb) Do not ring the bell for error messages
set novisualbell                "  (novb) Do not flash the visual bell for error messages
set hidden                      "   (hid) Buffers can exist in the bg without being a window
let python_highlight_all=1      " ------- Full Python highlighting support
syntax on                       "   (syn) Turn on syntax highlighting
let mapleader=','               " ------- <leader> key
let maplocalleader='['          " ------- <localleader> key
set autoread                    "    (ar) Auto-read a file that changed outside of Vim
set updatetime=500              "    (ut) Idle time (in ms) before the swapfile is written

" ======================= Theme =======================

" Custom Highlighting
highlight BadWhitespace ctermbg=red guibg=darkred

" Terminal Settings
set t_Co=256            " (number of colors) Support 256 color

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" =============== Relative Numbers ===============
" `relativenumber` was introduced in Vim 7.3.
" This provides compatibility for older versions of Vim
if exists("&norelativenumber")
    setlocal norelativenumber
endif

" ================ Turn Off Swap Files ==============
set noswapfile    " (noswf)
set nobackup      " (nobk)
set nowritebackup " (nowb)

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
        silent !mkdir ~/.vim/backups > /dev/null 2>&1
        set undodir=~/.vim/backups
        set undofile
endif

" ================ Indentation ======================
set cinwords=if,else,while,do,for,switch,case   " (cinw) The keywords that start
                                                "        an extra indent in the
                                                "        next line when
                                                "        'smartindent' or 'cindent'
                                                "        is set.
set autoindent                          "   (ai) Copy indent from current line when
                                        "        starting a new line
set cindent                             "  (cin) Enable automatic C program indenting
set cinoptions=:s,ps,ts,cs              " (cino) Affects the way `cin` reindents lines in
                                        "        C program.
set smartindent                         "   (si) Smart auto-indenting when starting a new line.
set smarttab                            "  (sta) When on, a <Tab> in front of
                                        "        a line insert blanks according to a
                                        "        'shiftwidth'.  'tabstop' or 'softtabstop'
                                        "        is used in other places.
set shiftwidth=4                        "   (sw) Number of spaces to use for each step
                                        "        of 'autoindent'. For: cindent and << / >>
set tabstop=4                           "   (ts) How many columns a tab counts for
set softtabstop=4                       "  (sts) How many columns Vim uses when pressing
                                        "        TAB in insert mode
set expandtab                           "   (et) Insert spaces when tabbing
set textwidth=0                         "   (tw) Max line length before wrapping
set nolist                              " (list) Don't show invisibles
set list listchars=tab:\ \ ,trail:·     "  (lcs) Invisibles mapping
set wrap                                " (wrap) Wrapping Enabled
" set nowrap                            "        Wrapping Disabled
set linebreak                           "  (lbr) Wrap lines at convenient pionts
set whichwrap+=<,>,h,l                  "   (ww) Keys allowed to move to the previous
                                        "        or next line when the cursor is on the
                                        "        first/last character in the line
set showbreak=">\ "                     "  (sbr) Suffix on wrapped line
set breakat="\ |@"                      "  (brk) Choose which characters might cause a break
                                        "        if 'linebreak' is on.

" Toggle invisibles
nmap <leader>l :set list!<CR>

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" ================ Folds ============================
set foldenable          "  (fen) Turn on folding
set foldmethod=indent   "  (fdm) Make folding indent sensitive
set foldopen-=search    "  (fdo) don't open folds when you search into them
set foldopen-=undo      "  (fdo) don't open folds when you undo stuff
set foldnestmax=3       "  (fdn) max nested folds

" ================ Scrolling ========================
set scrolloff=5         "   (so) Min number of screen lines to keep above and
                        "        below the cursor
set sidescrolloff=15    " (siso) Min number of screen columns to keep to the
                        "        left and right of the cursor if 'nowrap' is
                        "        set
set sidescroll=1        "   (ss) Min number of columns to scroll horizontally
                        "        Used with 'nowrap'

" ================ Completion =======================
set wildmenu
set wildmode=list:longest

" WildMenu Ignores - Things to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Search ===========================
set showmatch       "   (sm) Show matching brakets in insert mode
set smartcase       "  (scs) Override the 'ignorecase' option if the search
                    "        pattern contains uppercase characters.

set matchtime=5     "  (mat) How many tenths of a second to show the matching paren.
set hlsearch        "  (hls) Highlight the current search
set incsearch       "   (is) Show search result while typing
set ignorecase


" Other Stuff
set complete=.,w,b,t                    " XXX: Fill in
set printoptions=paper:letter           " XXX: Fill in
set modeline                            "   (ml) Mode Line enabled?
set modelines=5                         "  (mls) Number of lines check for set commands.
set autowrite                           "   (aw) Write the contents of the file, if modified on
                                        "        + :next / :rewind / :last / :first / :previous
                                        "        + :stop / :suspend / :tag / :! / :make
                                        "        + CTRL-] / CTRL-^
set nolazyredraw                        "   (lz) Only typing updates the screen
set mouse=a                             " ------ Mouse modes
                                        "        + n = normal
                                        "        + v = visual
                                        "        + i = insert
                                        "        + c = command
                                        "        + h = all previous when editing a help file
                                        "        + a = all previous modes
                                        "        + r = for hit-enter and more-prompt
set mousehide                           "   (mh) Hide the mouse after character are typed
set shortmess=aOtI                      "  (shm) Helps avoid all the hit-enter prompts (see help)
set report=0                            " ------ Threshold for reporting number of lines changed

set statusline=%F%m%r%h%w\ %y\ [\ A(%03.3b)\ .\:.\ H(%02.2B)\ .\:.\ L%04l\ -\ C%04v\ .\:.\ %p%%\ .\:.\ %L\ Length\ ]
set laststatus=2                        " always show the status line
set formatoptions=tcrqn                 " See Help (complex)

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

" Default Encoding
set encoding=utf-8

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
" sta = showtabline
" sts = softtabstop

" Common Code Styles and Practices
function SetupCommonCodeStyle()
    set fileformat=unix
    set textwidth=181
endfunction

" Two-Space Indentation; js/json/html/css/ruby
function SetupTwoSpaceIndentation()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    call SetupCommonCodeStyle()
endfunction

" Four-Space Indentation; preferred default
function SetupFourSpaceIndentation()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
    call SetupCommonCodeStyle()
endfunction

" Language: Ruby
function SetupRubyCodeStyle()
    " Include the common Code Style stuffs
    call SetupTwoSpaceIndentation()

endfunction

" Language: CoffeeScript
function SetupCoffeeScriptCodeStyle()
    " Include the common Code Style stuffs
    call SetupTwoSpaceIndentation()

    setlocal filetype=coffeescript
endfunction

" Language: Python
function SetupPythonCodeStyle()
    " Include the common Code Style stuffs
    call SetupFourSpaceIndentation()

    match BadWhitespace /\t/
endfunction

" Language: JavaScript
function SetupJavascriptCodeStyle()
    call SetupTwoSpaceIndentation()

endfunction

" Language: JSON
function SetupJsonCodeStyle()
    call SetupTwoSpaceIndentation()
    set showtabline

    " FormatOptions
    " ============================================================================
    " c = Auto-wrap comments using TextWidth, inserting the current comment
    "     leader automatically
    " r = Automatically insert the current comment leader after hitting
    "     <Enter> in Insert Mode
    " o = Automatically insert the current comment leader after hitting o/O in
    "     Normal mode
    " q = Allow formatting of comments with 'gq'
    " l = Long lines are not broken in insert mode (longer than TextWidth)
    set formatoptions=croql
endfunction

" Language: Makefile
function SetupMakefileCodeStyle()
    call SetupFourSpaceIndentation()

    set fdm=indent
    set noexpandtab
endfunction

if has("autocmd")
    augroup Standard
        au!
        au BufEnter * :syntax sync fromstart  " ensure every file does syntax highlighting (full)
        " au BufWritePre * :mark `|:%s/\s\+$//e|normal ``      " kill trailing whitespace at the end of lines before writing.
        au BufWritePre * :%s/\s\+$//e
        au BufReadPre,FileReadPre *.ini set ft=cfg " You can also use 'inifile' here, as well

        " What to do if you just type 'vim'
        autocmd vimenter * if !argc() | NERDTree | endif
    augroup END
    augroup CoffeeScript
        au!
        au BufReadPre,FileReadPre *.coffee call SetupCoffeeScriptCodeStyle()
    augroup END
    augroup Python
        au!
        " au FileType python :set ai sw=4 ts=4 sta et fo=croql fdm=indent foldlevel=99
        au BufRead,BufNewFile *.py call SetupPythonCodeStyle()
        au BufRead,BufNewFile python call SetupPythonCodeStyle()
        " au BufWritePre *.py :retab
    augroup END
    augroup FullStack
        au BufNewFile,BufRead *.js, *.html, *.css call SetupTwoSpaceIndentation()
    augroup END
    augroup JSON
        au!
        au BufEnter,BufNewFile,BufRead *.json call SetupJsonCodeStyle()
    augroup END
    augroup makefile
        au!
        au BufNewFile,BufRead Makefile call SetupMakefileCodeStyle()
        au BufEnter,BufNewFile,BufRead Makefile call SetupMakefileCodeStyle()
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
        au BufReadPre,FileReadPre *.pp set ft=puppet
        au BufEnter,BufNewFile,BufRead named.conf.local set ft=named
        au BufEnter,BufNewFile,BufRead named.conf.options set ft=named
        au BufEnter,BufNewFile,BufRead named.conf set ft=named
        au BufEnter,BufNewFile,BufRead *.zone set ft=bindzone
        au BufEnter,BufNewFile,BufRead /etc/icinga2/conf.d/* set ft=icinga
    augroup END
endif

" Split Window Management
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

let g:word_count="<unknown>"
fun! WordCount()
    return g:word_count
endfun

fun! UpdateWordCount()
    let s = system("wc -w ".expand("%p"))
    let parts = split(s, ' ')
    if len(parts) > 1
        let g:word_count = parts[0]
    endif
endfun

augroup WordCounter
    au! CursorHold * call UpdateWordCount()
    au! CursorHoldI * call UpdateWordCount()
augroup END

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

" Make the tab key dual purpose.
function! InsertTabWrapper()
    let col = col(".") - 1
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

" Toggle between numbers and relative numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

function! CurrentDirectory()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! WhichPyEnv()
    return system("/bin/which pyenv")
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


" Special Python Stuff
if !has('nvim')
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" ================ Custom Settings ========================
source ~/.vim/settings.vim
