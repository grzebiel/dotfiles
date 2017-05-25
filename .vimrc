
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


" ack (programmers grep) plugin
call dein#add('mileszs/ack.vim')
    "ack using ag
    if executable('ag')
      let g:ackprg = 'ag --vimgrep --ignore "build*" --ignore "tags"'
    endif

" file searcher (not only)
call dein#add('Shougo/unite.vim')
" vimproc a luncher
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" improved cpp coloring
call dein#add('octol/vim-cpp-enhanced-highlight')

" autocompletion
"call dein#add('vim-scripts/OmniCppComplete')
"    set completeopt=longest,menuone
"    "omnicpp config
"    set nocp
"    let OmniCpp_ShowAccess=1
"    let OmniCpp_ShowPrototypeInAbbr=1
"    "create ctags for omnicpp
    nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Vim git support
call dein#add('tpope/vim-fugitive')

"vim show line changed in according to git
call dein#add('airblade/vim-gitgutter')

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

"snippets manager
call dein#add('SirVer/ultisnips')

    " Snippets are separated from the engine. Add this if you want them:
    call dein#add('honza/vim-snippets')

    " Trigger configuration.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

"better support for Markdown fils
"call dein#add('plasticboy/vim-markdown')

"
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
" Colorscheme that works nice with vimdiff
set background=dark

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

" Display the cursor position
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" dialogue asking if you wish to save changed files.
set confirm

" disable all bells
set visualbell
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab

" cursor line highlight
set cursorline
" cursorline number set
hi CursorLineNr cterm=bold ctermfg=Yellow gui=bold guifg=Yellow
hi CursorLine ctermbg=234 cterm=NONE
" Spelling mistakes don't interfere with cursorline
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=Red

" always show few top or bottom lines around cursor
set scrolloff=5


"utf8
set encoding=utf8

"display relative numbers
set relativenumber

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


" vim as man pager required
runtime! ftplugin/man.vim

" rfc syntax
 if expand('%:t') =~? 'rfc\d\+'
      setfiletype rfc
 endif

" color all whitespace but non-tailing space
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" vim using 256 bit colors
set t_Co=256

" vim as man viewer required:
let $PAGER=''

nnoremap <silent> <c-p> :FZF<cr>
"fzf (bash fuzzy finder) vim plugin
set rtp+=~/.fzf

"Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
"replacing unite with ctrl-p
let g:unite_source_file_rec_max_cache_files=5000
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
"use ag instead of grep
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4 --ignore "build*" --ignore "tags"'
    let g:unite_source_grep_recursive_opt=''
endif
nnoremap <Leader>/ :Unite grep:.<cr>
"unite grep for search under cursor
nnoremap <Leader>g "zyiw<space>:Unite grep:.<CR><C-r>z<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <Leader>y :Unite history/yank<cr>
nnoremap <Leader>s :Unite buffer<cr>

"clang format mapping
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf usr/share/clang/clang-format.py<cr>

"youcompleteme
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
