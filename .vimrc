
set nocompatible               " Be iMproved

" space ftw
let mapleader = "\<Space>"

"---------  dein Scripts  -----------------------------

" Required:
set runtimepath^=/home/grzebiel/.vim/bundle//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/grzebiel/.vim/bundle/'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')

" Add or remove your Bundles here:
" file system browser
call dein#add('scrooloose/nerdtree')
    "toggle nerdtree using Leader-n
    nnoremap <Leader>n :NERDTreeToggle<cr>
    let g:NERDTreeWinPos='right'

" status line for vim
call dein#add('itchyny/lightline.vim')
    let g:lightline = {
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
          \ }

    function! LightLineFugitive()
        return exists('*fugitive#head') ? ' ' . fugitive#head() : ''
    endfunction

call dein#add('aklt/plantuml-syntax')

" ack (programmers grep) plugin
call dein#add('mileszs/ack.vim')
    "ack using ag
    if executable('ag')
      let g:ackprg = 'ag --vimgrep --ignore "build*" --ignore "tags"'
    endif

" improved cpp coloring
call dein#add('octol/vim-cpp-enhanced-highlight')

nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Vim git support
call dein#add('tpope/vim-fugitive')

"vim show line changed in according to git
call dein#add('airblade/vim-gitgutter')
let g:gitgutter_map_keys = 0


"syntax external checker
"call dein#add('scrooloose/syntastic')
"    "syntastic (syntax checker) Options
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*
"
"    let g:syntastic_always_populate_loc_list = 1
"    let g:syntastic_auto_loc_list = 1
"    let g:syntastic_check_on_open = 0
"    let g:syntastic_check_on_wq = 0
"    let g:syntastic_javascript_checkers = ['jshint']
"
"    "C++ lags
"    let g:syntastic_cpp_compiler = "clang++"
"    let g:syntastic_cpp_compiler_options = '-std=c++14'"

"syntax asynchronous checker
call dein#add('w0rp/ale')
let g:ale_linters = {'cpp': [], }
let g:ale_python_flake8_options = '--ignore E501'

"snippets manager
call dein#add('SirVer/ultisnips')

    " Snippets are separated from the engine. Add this if you want them:
    " call dein#add('honza/vim-snippets')

    " Trigger configuration.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " place proper author for snippets
    let g:snips_author = "grzebiel"
"better support for Markdown fils
"call dein#add('plasticboy/vim-markdown')
"
" cmake syntax
call dein#add("nickhutchinson/vim-cmake-syntax")

"interpret ansi colorng
"call dein#add("vim-scripts/AnsiEsc.vim")

" vim fzf plugin
call dein#add("junegunn/fzf.vim")
    nnoremap <Leader>s :Buffers<cr>
    nnoremap <Leader>g "zyiw:Ag <C-r>z<cr>
    nnoremap <Leader>/ :Ag 
    nnoremap <silent> <c-p> :FZF<cr>

    autocmd VimEnter * command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'down': '40%'}))


call dein#add('potatoesmaster/i3-vim-syntax')

call dein#add('rust-lang/rust.vim')

call dein#add('tpope/vim-commentary')
call dein#add('wellle/targets.vim')

" distraction free vim
call dein#add("junegunn/goyo.vim")
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

call dein#add("junegunn/limelight.vim")
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

  let g:vimwiki_map_prefix = '<Leader>e'
call dein#add("vimwiki/vimwiki")
  let wiki = {}
  let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
  let wiki.auto_toc = 1
  let g:vimwiki_list = [wiki]

call dein#add("neoclide/coc.nvim", {'build': './install.sh'})

" Required:
call dein#end()
"
" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if dein#check_install()
    call dein#install()
endif
"End NeoBundle Scripts-------------------------

"-----------------------------------------------------------
"---------  Must have  -------------------------------------
"-----------------------------------------------------------

" Enable syntax highlighting
syntax on

" Reuse window for saved and unsaved files in diferrent buffers.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" keep the indent
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Always display the status line, even if only one window is displayed
set laststatus=2

" dialogue asking if you wish to save changed files.
set confirm

" disable all bells
set visualbell
set t_vb=

" Disable mouse by default
set mouse=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

"display relative numbers
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab

" cursor line highlight
set cursorline

" always show few top or bottom lines around cursor
set scrolloff=5

"utf8
set encoding=utf8

" cpp don't indent namespaces
set cinoptions=N-s

"colorscheme
colorscheme my_dark_colorscheme

"-----------------------------------------------------------
"---------  Mappings ---------------------------------------
"-----------------------------------------------------------

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map <Leader>w for :w
nnoremap <Leader>w :w<CR>

" cpp related mappings
autocmd FileType cpp nnoremap <F3> :e <C-r>%<C-w>cpp<CR>
autocmd FileType cpp nnoremap <F2> :e <C-r>%<C-w>hpp<CR>


" vim as man pager required
runtime! ftplugin/man.vim
let $PAGER=''

" rfc syntax
 if expand('%:t') =~? 'rfc\d\+'
      setfiletype rfc
 endif

" color all whitespace but non-tailing space
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" vim using 256 bit colors
set t_Co=256

"clang format mapping
autocmd FileType cpp noremap <C-K> :pyf /usr/share/clang/clang-format.py<cr>
autocmd FileType inoremap <C-K> <c-o>:pyf usr/share/clang/clang-format.py<cr>

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

set incsearch

vnoremap / "zy/<C-r>z<cr>

nnoremap <bs> <c-^>

nnoremap ; :
nnoremap : ;
vnoremap ; :

"splits
nnoremap <C-w>\| :vsp<cr>
nnoremap <C-w>- :vs<cr>

" reload vimrc on write to it
augroup VimReload
autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

command! RC :execute ':next $MYVIMRC'
command! BIN :execute ':next ~/bin'

"move to the split in the direction shown, or create a new split
nnoremap <silent> <Leader>h :call WinMove('h')<cr>
nnoremap <silent> <Leader>j :call WinMove('j')<cr>
nnoremap <silent> <Leader>k :call WinMove('k')<cr>
nnoremap <silent> <Leader>l :call WinMove('l')<cr>

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
