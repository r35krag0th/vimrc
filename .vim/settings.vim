let vimsettings = '~/.vim/settings'
let vundlesettings = '~/.vim/settings/vundle'
let uname = system("uname -s")

" Load any additional settings here.
for fpath in split(globpath(vimsettings, '*.vim'), '\n')
    " echo "Including settings file ==> " . fpath
    if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
        continue " skip mac mappings for linux
    endif

    if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
        continue " skip linux mappings for mac
    endif

    exe 'source' fpath
endfor

if isdirectory(expand(vundlesettings))
    " Load any vundle-specific settings here
    for fpath in split(globpath(vundlesettings, '*.vim'), '\n')
        " echo "Loading Vundle Settings ==> " . fpath
        exec 'source' fpath
    endfor
endif
