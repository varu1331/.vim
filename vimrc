"set nocompatible is commmon for vim
set nocompatible

"colors
let base16colorspace=256
colorscheme base16-eighties
syntax enable "adds syntax highlighting

"spaces and tabs
set tabstop=4 "number of visual spaces per tab
set softtabstop=4 "number of spaces in tab when editing
set shiftwidth=4 "sets default indent size
set expandtab "makes tabs into spaces
set autoindent "turns auto indenting of
set smartindent "indents smartly based on file?

"tab for autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

"ui configuration
set relativenumber "shows relative line numbers
set number "shows line number
set showcmd "puts last used command in bottom right
set ruler "adds ruler to bottom of screen
filetype indent on "loads specific indent files based on filetype NOT CONFIGURED YET
set wildmenu "visual autocomplete for command menu
set showmatch "highlights matching [{()}]
set nowrap "do not automatically wrap on load
set formatoptions-=t "do not automatically wrap text when typing

"searching
set incsearch "searches as characters are entered
set hlsearch "highlights matches 

"folding
set foldenable "enable folding

"determines backup, swp, and undo settings
set nobackup
set nowritebackup
"set backupdir=~/.vim/.backup//
set noundofile
"set undodir=~/.vim/.undo//
set noswapfile
"set directory=~/.vim/.swap//

"plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs' 
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/commentary.git'

call plug#end()

"mappings
let mapleader = " " 
nnoremap <leader>j 10j
nnoremap <leader>k 10k
nnoremap <leader>h ^
nnoremap <leader>l $
inoremap jk <esc>
nnoremap <leader>g G
