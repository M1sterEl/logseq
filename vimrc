set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" general
Plugin 'scrooloose/nerdcommenter'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " tree file view

" vim auto save
Plugin '907th/vim-auto-save'

" colors scheme:
Plugin 'morhetz/gruvbox'

" status line:
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" python:
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.cim'
Plugin 'vim-syntastic/syntstic'
Plugin 'scrooloose/syntastic'

" C#
"Plugin 'OmniSharp/omnisharp-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" commends:
set nu " numbers on the left
set showcmd " show commends in the right corner
set scrolloff=7 " display 7 lines when scrolling
set hlsearch " highlights matching search patterns
let g:auto_save = 0.5 " auto save thing
set tabstop=4 " sets tab to 4 spaces
set nowrap " disables wrapping
set shiftwidth=4
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
" --key mapping:

" add a blank line below
noremap <C-l> o<Esc>

" toggeling errors winow
noremap <C-t> :SyntasticToggleMode<CR>

" setting save to ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<cr>

" refresh filetype detect
nnoremap <C-m> :filetype detect<CR>

" toggles tree view
noremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <Esc>:NERDTreeToggle<CR>

" python things:
au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set encoding=utf-8 |
	\ set textwidth=140

let python_highlight_all=1
syntax on

" auto complete python help:
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" themes:
colorscheme gruvbox
set background=dark

" linter
let g:Syntastic_checkers = ['vint', 'flake8', 'C#']
let g:syntastic_loc_list_height = 3

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let asmsyntax = "tasm" " tasm syntax highlighting
