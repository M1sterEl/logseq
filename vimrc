set nocompatible              " be iMproved, required filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" general
Plugin 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntstic'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree' " tree file view
Plugin 'xolox/vim-notes' " for note taking
Plugin 'xolox/vim-misc' " need for vim-notes
Plugin 'tinyheero/vim-myhelp' " plugin for in vim cheat sheet
Plugin 'tommcdo/vim-exchange' " plugin for switchin two words with ease

" navigation
Bundle 'camflint/vim-paraglide'
Plugin 'AlphaMycelium/pathfinder.vim'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim auto save
Plugin '907th/vim-auto-save'

" colors scheme:
Plugin 'morhetz/gruvbox'

" status line:
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

" python:
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" commands:
" lets color scheme work with spell checking
augroup my_colours
  autocmd!
  autocmd ColorScheme gruvbox hi SpellBad cterm=reverse
augroup END

set spell " sets spell checking
set spelllang=en_us " sets spell checking to to English
"set nu " numbers on the left
set relativenumber " shows numbers for lines relative to the current line
set number " shows the line number you're currently on
set showcmd " show commends in the right corner
set scrolloff=6 " display 7 lines when scrolling
set hlsearch " highlights matching search patterns
let g:auto_save = 0.5 " auto save thing
set tabstop=4 " sets tab to 4 spaces
set nowrap " disables text wrapping
set shiftwidth=4
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
set formatoptions-=tc

" --key mapping:

" binding for paragraph navigation
nmap <silent> <C-j> <Plug>ParaglideDownAny
nmap <silent> <C-k> <Plug>ParaglideUpAny

" add a blank line below
noremap <C-l> o<Esc>

" toggling errors window
noremap <C-t> :SyntasticToggleMode<CR>

" setting save to ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<cr>

" refresh filetype detect
" <C-m> is the equivalent of pressing enter
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
