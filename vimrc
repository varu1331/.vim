"set nocompatible is commmon for vim
set nocompatible

"COLORS
let base16colorspace=256
colorscheme base16-eighties
syntax enable "adds syntax highlighting

"SPACES AND TABS 
let indent=4 "number of spaces to indent
let &tabstop=indent "number of visual spaces per tab
let &softtabstop=indent "number of spaces in tab when editing
let &shiftwidth=indent "sets default indent size
set expandtab "makes tabs into spaces
set autoindent "turns auto indenting of
set smartindent "indents smartly based on file?

"TAB AUTOCOMPLETION
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

"UI CONFIGURATION
set relativenumber "shows relative line numbers
set number "shows line number
set showcmd "puts last used command in bottom right
set ruler "adds ruler to bottom of screen
filetype indent on "loads specific indent files based on filetype NOT CONFIGURED YET
set wildmenu "visual autocomplete for command menu
set showmatch "highlights matching [{()}]
set nowrap "do not automatically wrap on load
set formatoptions-=t "do not automatically wrap text when typing

"LIST CHARS
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

"SEARCHING
set incsearch "searches as characters are entered
set hlsearch "highlights matches 

"FOLDING
set foldenable "enable folding

"BACKUP, UNDOW, and SWAP
set nobackup
set nowritebackup
"set backupdir=~/.vim/.backup//
set noundofile
"set undodir=~/.vim/.undo//
set noswapfile
"set directory=~/.vim/.swap//

"PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs' 
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"nerdtree commenter
"conquer of completion?

call plug#end()

"EXTERNAL SOURCES
source $HOME/.vim/plug-config/coc.vim

"MAPPINGS
"sets mapleader to be used on custom commands
let mapleader=" "

"move down by 10
nnoremap <leader>j 10j

"move up by 10
nnoremap <leader>k 10k

"move to the begining of text on a line
nnoremap <leader>h ^

"move to the end of text on a line
nnoremap <leader>l $

"add jk as a quick escape from insert mode  
inoremap jk <esc>

"jump to end of file withou having to use capital letter
nnoremap <leader>g G

"makes tab indent right in normal mode
nnoremap <tab> >>

"makes shift tab indent remove indent in normal mode
nnoremap <S-tab> <<

"allows for a new line to be add below cursor line
nnoremap <c-n> @="m'o\eg''"<cr>

"allows for new line to be added above cursor line
nnoremap <c-p> @="m'O\eg''"<cr>
