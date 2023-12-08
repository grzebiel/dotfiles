set background=dark
highlight clear"preview"}
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "my_dark_colorscheme"

hi CursorLine ctermbg=234 guibg=#151515 cterm=NONE gui=NONE
" cursorline number set
hi CursorLineNr cterm=bold ctermfg=Yellow gui=bold guifg=Yellow
" Spelling mistakes don't interfere with cursorline
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=Red guifg=Red gui=underline,bold
hi CocFloating ctermbg=black guibg=#000000
hi CocInlayHint ctermfg=blue guifg=#1a8fff
hi CocMenuSel ctermbg=234 guibg=#151515
hi SignColumn ctermbg=NONE guibg=NONE
hi VertSplit ctermbg=NONE cterm=NONE guibg=#000000 gui=NONE
hi Pmenu ctermbg=black ctermfg=White guibg=#000000 guifg=#ffffff
hi PmenuSel ctermbg=234 guibg=#151515
hi Conceal guibg=#000000 guifg=#a7a7a7
hi Visual ctermbg=242 guibg=#353535
hi Type ctermfg=121 gui=NONE guifg=#60ff60
hi Statement ctermfg=11 gui=NONE guifg=#ffff60

" Whichkey window
hi WhichKeyFloat ctermbg=NONE guibg=NONE

hi Normal ctermbg=black
" Noice cursor in popup cmd
hi NoiceCursor cterm=reverse gui=reverse
