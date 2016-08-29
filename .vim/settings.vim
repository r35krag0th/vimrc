let vimsettings = '~/.vim/settings'
let vundle_inc_dir = '~/.vim/vundles'
let uname = system("uname -s")

" Load any additional settings here.
for fpath in split(globpath(vundle_inc_dir, '*.vundle'), '\n')
    echo "Including Vundle requirements ==> " . fpath
    exe 'source' fpath
endfor

