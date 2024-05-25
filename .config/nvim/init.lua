vim.g.mapleader = " "
require('plugins')

-- display status line only once
vim.opt.laststatus = 3

-- ask on exiting unsaved file
vim.opt.confirm = true

-- avoid screen jumping
vim.opt.cmdheight=2

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- ignorecase for tab completion commands
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true

-- cursorline
vim.opt.cursorline=true

-- show top and botom if possible
vim.opt.scrolloff=5

-- cpp dont indent namespace
vim.opt.cinoptions="N-s"

-- colorscheme
vim.cmd [[colorscheme vim]]
vim.cmd [[colorscheme my_dark_colorscheme]]

-- lightline options
vim.cmd [[    let g:lightline = {
          \ 'colorscheme': 'powerline',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
          \ },
          \ 'component': {
          \   'readonly': '%{&readonly?"":""}',
          \   'modified': '%{&filetype=="help"?"":&modified?" ":&modifiable?"":"-"}'
          \ },
          \ 'component_function': {
          \   'fugitive': 'LightLineFugitive',
          \ },
          \ 'separator': { 'left': '', 'right': '' },
          \ 'subseparator': { 'left': '|', 'right': '|' }
          \ } ]]

vim.cmd [[
    function! LightLineFugitive()
        return exists('*fugitive#head') ? ' ' . fugitive#head() : ''
    endfunction
]]

-- ack use rg
vim.cmd [[
    if executable('rg')
      let g:ackprg = 'rg --vimgrep --ignore "build*" --ignore "tags"'
    endif
]]

-- gitgutter
vim.g.gitgutter_map_keys = 0

-- fzf bindings
vim.cmd [[
    nnoremap <Leader>s :Buffers<cr>
    nnoremap <Leader>g "zyiw:Ag <C-r>z<cr>
    nnoremap <Leader>/ :Ag 
    nnoremap <silent> <c-p> :FZF<cr>

    autocmd VimEnter * command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'down': '40%'}))

    " An action can be a reference to a function that processes selected lines
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
      copen
      cc
    endfunction

    let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
    let $FZF_DEFAULT_COMMAND="rg   --hidden -l -g '!.git' \"\""
    let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --bind ctrl-a:select-all"
]]

-- goyo and limelight
vim.cmd [[
    function! s:goyo_enter()
        set noshowmode
        set noshowcmd
        set scrolloff=999
        Limelight
    endfunction
    function! s:goyo_leave()
        set showmode
        set showcmd
        set scrolloff=5
        Limelight!
    endfunction
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

]]
vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240

-- man pages in vim
vim.cmd [[
    runtime! ftplugin/man.vim
    let $PAGER=''
]]

-- mark trailing whitespace etc
vim.opt.listchars = "tab:>-,trail:~,extends:>,precedes:<"
vim.opt.list = true


-- liked mappings: splits, and movements
vim.cmd [[
    nnoremap <bs> <c-^>

    nnoremap ; :
    nnoremap : ;
    vnoremap ; :

    "splits
    nnoremap <C-w>\| :vsp<cr>
    nnoremap <C-w>- :vs<cr>

    nnoremap <silent> <C-h> :call WinMove('h')<cr>
    nnoremap <silent> <C-j> :call WinMove('j')<cr>
    nnoremap <silent> <C-k> :call WinMove('k')<cr>
    nnoremap <silent> <C-l> :call WinMove('l')<cr>
    tnoremap <silent> <C-h> <c-\><c-n>:call WinMove('h')<cr>
    tnoremap <silent> <C-j> <c-\><c-n>:call WinMove('j')<cr>
    tnoremap <silent> <C-k> <c-\><c-n>:call WinMove('k')<cr>
    tnoremap <silent> <C-l> <c-\><c-n>:call WinMove('l')<cr>

    function! WinMove(key)
      let t:curwin = winnr()
      exec "wincmd ".a:key
      if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
          wincmd v
        else
          wincmd s
        endif
        exec "wincmd ".a:key
      endif
    endfunction
]]

-- always show the signcolumn to avoid screen shift
vim.opt.signcolumn = "yes"

-- no symbel in window splits
vim.opt.fillchars:append("vert:│")

-- ignore backup files to avoid coc issues
vim.opt.backup = false
vim.opt.writebackup = false

-- faster updatetime
vim.opt.updatetime=300

-- remap terminal esc
vim.cmd [[
    tnoremap <esc><esc> <c-\><c-n>
]]

-- completeopt
vim.opt.completeopt = {"menuone", "noselect", "preview"}

-- more colors
vim.opt.termguicolors = true
