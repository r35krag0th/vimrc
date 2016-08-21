" Ansible Configuration
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"

" g:ansible_attribute_highlight
" ============================================================
" a: highlight all instances of key=
" o: highlight only instances of key= found on newlines
" d: dim the instances of key= found
" b: brighten the instances of key= found
" n: turn this highlight off completely
let g:ansible_attribute_highlight = "ob"


" g:ansible_name_highlight
let g:ansible_name_highlight = 'd'
"
" Ansible modules commonly start with a name: key for self-documentation of playbooks. This option enables/changes highlight of this.
"
" Available flags (this feature is off by default):
"
" d: dim the instances of name: found
" b: brighten the instances of name: found
" g:ansible_extra_keywords_highlight

let g:ansible_extra_keywords_highlight = 1


