set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "my_dark_colorscheme"

hi CursorLine ctermbg=234 cterm=NONE
" cursorline number set
hi CursorLineNr cterm=bold ctermfg=Yellow gui=bold guifg=Yellow
" Spelling mistakes don't interfere with cursorline
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=Red
