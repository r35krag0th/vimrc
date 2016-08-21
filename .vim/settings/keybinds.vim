" Real tabs!
noremap <tab> <nop>

" No arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" This puts our search term in the middle of the screen
nmap n nmzz.`z
nmap N Nmzz.`z
nmap * *mzz.`z
nmap # #mzz.`z
nmap g* g*mzz.`z
nmap g# g#mzz.`z

" -- remap parentheses operator to p
onoremap p i(

nnoremap / /\v
vnoremap / /\v
nnoremap ? /\v
vnoremap ? /\v

nnoremap <leader><space> :noh!<cr>

" Map the function to tab
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

if v:version < 704
    nnoremap <silent> <leader>n :call NumberToggle()<cr>
else
    set relativenumber
    set number
endif

" toggle paste/nopaste modes
nnoremap <silent> <Leader>p :set paste! paste?<CR>

nmap <leader>v "+gP
" imap <C-V> <ESC><C-V>i
vmap <leader>c "+y

" Enable folding with the spacebar
nnoremap <space> za

