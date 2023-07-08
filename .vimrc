set nocompatible
filetype off

" set the runtime path to include Vundle, and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'rakr/vim-one'                      " colorscheme
"Plugin 'morhetz/gruvbox'                   " colorscheme
"Plugin 'romainl/Apprentice'                " colorscheme
Plugin 'drewtempelmeyer/palenight.vim'      " colorscheme
Plugin 'vim-airline/vim-airline'            " Status bar

"Plugin 'chrisbra/unicode.vim'               " let me hit F4 when on =>
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmux-plugins/vim-tmux-focus-events' " enable autosave on focus lost
Plugin 'wincent/terminus'                   " autosave plus cursor change on insert mode
"Plugin 'wincent/command-t'                  " \t everything
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'aserebryakov/vim-todo-lists'
"Plugin 'Vimjas/vim-python-pep8-indent'      " correct indents for python

"Plugin 'wting/rust.vim'                     " enable syntax highlighting for rust
Plugin 'plasticboy/vim-markdown'
"Plugin 'vimwiki/vimwiki'
"Plugin 'tpope/vim-surround'
"Plugin 'philippkeller/vim-marked'
call vundle#end()

"""" Basic Behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=              " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set spelllang=en,de
set foldlevel=2
set clipboard=unnamed

"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
nnoremap  :m '{<CR>==
nnoremap Ô :m '}-1<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

nmap <silent> <leader>sb ysis*gvS*
nmap <silent> <leader>wb ysiw*gvS*

"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
colorscheme palenight      " good colorschemes: murphy, slate, molokai, badwolf, solarized

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on
let g:one_allow_italics = 0

"""" Tab settings

filetype plugin indent on

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width
let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

"set tabstop=2           " number of spaces per <TAB>
"set expandtab           " convert <TAB> key-presses to spaces
"set shiftwidth=2        " set a <TAB> key-press equal to 4 spaces

"""" Swapfiles

set directory=
set directory=~/.vim/swapfiles//

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')

set background=dark 
set nohlsearch          " never highlight search hits

:au FocusLost * :wa

" Vimwiki

let g:vimwiki_list = [{'path': '~/Documents/', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/Private/', 'syntax': 'markdown', 'ext': '.md'}]
