"colors
let base16colorspace=256
colorscheme base16-eighties
syntax enable "adds syntax highlighting

"spaces and tabs
set tabstop=4 "number of visual spaces per tab
set softtabstop=4 "number of spaces in tab when editing
set expandtab "makes tabs into spaces
set autoindent "turns it on
set smartindent "does the right thing (mostly) in programs

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

"determines backup settings
if has("vms")
    set nobackup
else 
     set backup
     if has('persistent_undo')
        set undofile
     endif
endif

"plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs' 
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/commentary.git'

call plug#end()
