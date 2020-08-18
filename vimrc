"set nocompatible is commmon for vim
set nocompatible

"COLORS
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background

    "custom statusline colors
    autocmd ColorScheme * highlight NormalMode ctermbg=019 ctermfg=012
    autocmd ColorScheme * highlight InsertMode ctermbg=019 ctermfg=010
    autocmd ColorScheme * highlight ReplaceMode ctermbg=019 ctermfg=009
    autocmd ColorScheme * highlight VisualMode ctermbg=019 ctermfg=016
    autocmd ColorScheme * highlight CommandMode ctermbg=019 ctermfg=015
endif
syntax enable "adds syntax highlighting

"SPACES, TABS, and BACKSPACE
let indent=4 "number of spaces to indent
let &tabstop=indent "number of visual spaces per tab
let &softtabstop=indent "number of spaces in tab when editing
let &shiftwidth=indent "sets default indent size
set backspace=indent,eol,start
set expandtab "makes tabs into spaces
set autoindent "turns auto indenting on
set smartindent "indents smartly based on file?

"FILETYPES
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

"UI CONFIGURATION
set relativenumber "shows relative line numbers
set number "shows line number
set showcmd "puts last used command in bottom right
"set ruler "adds ruler to bottom of screen
"filetype indent on "loads specific indent files based on filetype NOT CONFIGURED YET
set wildmenu "visual autocomplete for command menu
set showmatch "highlights matching [{()}]
set nowrap "do not automatically wrap on load
set formatoptions-=t "do not automatically wrap text when typing
set formatoptions-=o "do not automatically insert current comment leader after using o or O
set noshowmode "doesn't show mode in command line

"STATUSLINE
set laststatus=2
set statusline=%#StatusLine#
set statusline+=\ %n "buffer number
set statusline+=%#NormalMode#%{(mode()=='n')?'\ NORMAL\ ':''} "display mode normal
set statusline+=%#InsertMode#%{(mode()=='i')?'\ INSERT\ ':''} "display mode insert
set statusline+=%#VisualMode#%{(mode()=='v')?'\ VISUAL\ ':''} "display mode visual
set statusline+=%#ReplaceMode#%{(mode()=='R')?'\ REPLACE\ ':''} "display mode replace
set statusline+=%#CommandMode#%{(mode()=='c')?'\ COMMAND\ ':''} "display mode command
"set statusline+=%#StatusLine#%{StatuslineGit()}
set statusline+=%#StatusLine#%t\  "tail of the filename
set statusline+=%m "modified flag
set statusline+=%r "read only flag
set statusline+=%y "filetype
set statusline+=%= "left/right separator
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]\  "file format
set statusline+=%c\  "cursor column
set statusline+=%l/%L\  "cursor line/total lines
set statusline+=\ %{strftime(\"%H:%M\")} "time

"LIST CHARS
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

"SEARCHING
set incsearch "searches as characters are entered
set hlsearch "highlights matches 

"FOLDING
set foldenable "enable folding

"BACKUP, UNDO, and SWAP
set nobackup
set nowritebackup
"set backupdir=~/.vim/.backup//
"setup persistent_undo
if has('persistent_undo')
    let undoPath = expand("~/.vim/.undos")

    if !isdirectory(undoPath)
        call mkdir(undoPath, "p")
    endif

    let &undodir = undoPath
    set undofile
endif
set noswapfile
"set directory=~/.vim/.swap//

"MACROS
set lazyredraw "prevents vim from redrawing screen on every macro step

"PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs' 
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'chriskempson/base16-vim'
let g:polyglot_disabled = ['python-indent']
Plug 'sheerun/vim-polyglot'

"nerdtree commenter

call plug#end()
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"EXTERNAL CONFIGURATION
source $HOME/.vim/pluginConfig/coc.vim
source $HOME/.vim/pluginConfig/polyglot.vim

"MAPPINGS
"sets mapleader to be used on custom commands
let mapleader=" "

"move down and up by 10
nnoremap <leader>j 10j
nnoremap <leader>k 10k

"move to the begining of TEXT on a line
nnoremap <leader>h ^

"move to the end of text on a line
nnoremap <leader>l $

"add jk as a quick escape from insert mode
inoremap jk <esc>l
inoremap JK <esc>l

"jump to end of file without having to use capital letter
nnoremap <leader>g G

"makes tab indent right in normal mode
nnoremap <tab> >>

"makes shift tab indent remove indent in normal mode
nnoremap <S-tab> <<

"allows for a new line to be add below cursor line
"nnoremap <c-n> @="m'o\eg''"<cr>
nnoremap <leader>o moo<Esc>`o

"allows for new line to be added above cursor line
"nnoremap <c-p> @="m'O\eg''"<cr>
nnoremap <leader>O moO<Esc>`o

"allows for easier execution of last used macro
nnoremap Q @@

"remove ctrl w from window mappings
nnoremap <leader>w <c-w>

"use reverse f (F) without using capital letter
nnoremap <leader>f F
onoremap <leader>f F

"use reverse t (T) without using capital letter
nnoremap <leader>t T
onoremap <leader>t T

"change split sizes
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>

"quick buffer movement
nnoremap <F7> :buffers<C-M>:b
nnoremap <leader>p :bp<C-M>
nnoremap <leader>n :bn<C-M>

"quick mark movement
nnoremap <leader>' `
