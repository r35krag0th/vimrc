" Vim color file
" Maintainer:    Hans Fugal <hans@fugal.net>
" Last Change:    $Date: 2003/07/24 00:57:11 $
" Last Change:    $Date: 2003/07/24 00:57:11 $
" URL:        http://hans.fugal.net/vim/colors/desert.vim
" Version:    $Id: desert.vim,v 1.7 2003/07/24 00:57:11 fugalh Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="desert"

hi Normal    guifg=White guibg=grey20

" highlight groups
hi Cursor    guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit    guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded    guibg=grey30 guifg=gold
hi FoldColumn    guibg=grey30 guifg=tan
hi IncSearch    guifg=slategrey guibg=khaki
"hi LineNr
hi ModeMsg    guifg=goldenrod
hi MoreMsg    guifg=SeaGreen
hi NonText    guifg=LightBlue guibg=grey30
hi Question    guifg=springgreen
hi Search    guibg=peru guifg=wheat
hi SpecialKey    guifg=yellowgreen
hi StatusLine    guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC    guibg=#c2bfa5 guifg=grey50 gui=none
hi Title    guifg=indianred
hi Visual    gui=none guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg    guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment    guifg=SkyBlue
hi Constant    guifg=#ffa0a0
hi Identifier    guifg=palegreen
hi Statement    guifg=khaki
hi PreProc    guifg=indianred
hi Type        guifg=darkkhaki
hi Special    guifg=navajowhite
"hi Underlined
hi Ignore    guifg=grey40
"hi Error
hi Todo        guifg=orangered guibg=yellow2

" color terminal definitions
" ------------------------------------
"  This looks nothing like the GUI Version /cry
"
"  NAME                CTERM            FG                /BG
hi SpecialKey    cterm=NONE    ctermfg=lightblue    ctermbg=NONE
hi NonText        cterm=bold    ctermfg=darkblue    ctermbg=NONE
hi Directory    cterm=NONE    ctermfg=darkcyan    ctermbg=NONE
hi ErrorMsg        cterm=bold    ctermfg=white        ctermbg=red

hi IncSearch    cterm=bold    ctermfg=darkgrey    ctermbg=lightblue
hi Search        cterm=NONE    ctermfg=blue        ctermbg=darkgrey

hi MoreMsg        cterm=NONE    ctermfg=yellow        ctermbg=black
hi ModeMsg        cterm=NONE    ctermfg=yellow        ctermbg=black
hi LineNr        cterm=NONE    ctermfg=darkmagenta    ctermbg=darkgrey
hi Question        cterm=NONE    ctermfg=lightgreen    ctermbg=NONE

hi StatusLine    cterm=bold    ctermfg=white        ctermbg=darkblue
hi StatusLineNC cterm=bold    ctermfg=white        ctermbg=darkblue

hi VertSplit    cterm=reverse                    ctermbg=cyan
hi Title                    ctermfg=5
hi Visual        cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg                ctermfg=1

" {{{ Status Line Auto-Completer
hi WildMenu        cterm=bold    ctermfg=NONE        ctermbg=darkgray
" }}}
" {{{ Folding
hi Folded        cterm=bold,underline    ctermfg=white        ctermbg=magenta
hi FoldColumn    cterm=bold    ctermfg=lightgray    ctermbg=darkgray
" }}}
" {{{ Diff
hi DiffAdd        ctermfg=white ctermbg=green
hi DiffChange    ctermbg=darkgrey ctermfg=white
hi DiffDelete    cterm=bold ctermfg=white ctermbg=darkred
hi DiffText        cterm=bold ctermbg=NONE ctermfg=white
" }}}
"
" {{{ Code-Based Colors
" Code Comments (//,#,",/**/)
hi Comment        ctermfg=darkcyan

" Constants (Quoted stuff)
hi Constant        ctermfg=darkyellow

" Parents, and Braces
hi Special        cterm=bold ctermfg=white

" Variable Names
hi Identifier    ctermfg=darkcyan

" KEYWORDS and $
hi Statement    ctermfg=LightCyan

" Built-in Functions
hi PreProc        cterm=bold ctermfg=LightBlue ctermbg=none

" Other Keywords
hi Type            ctermfg=darkgreen
" }}}
hi Underlined    cterm=underline ctermfg=5
hi Ignore        cterm=bold ctermfg=7
hi Ignore        ctermfg=darkgrey
hi Error        cterm=bold ctermfg=7 ctermbg=1

"
" Special Stuff
"
hi BeyondEighty cterm=bold ctermfg=white ctermbg=red guifg=lightred
hi PavlovMedia  cterm=bold ctermfg=magenta guifg=lightmagenta
hi SubversionID cterm=bold ctermfg=green guifg=lightgreen
hi Redirect     ctermfg=cyan guifg=lightblue
hi LogEvent     ctermfg=cyan guifg=lightblue

"vim: sw=4
