" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=/home/julian/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
Plugin 'sjl/gundo.vim.git'
Plugin 'kien/ctrlp.vim'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

" All of your Plaguns must be added before the following line
call vundle#end()

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Color sheme, backgroundcolor, etc. 
syntax enable
set background=dark
colorscheme badwolf 
" colorscheme solarized

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set number		" Show line numbers
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set cursorline		" Highlight current cursor line
set wildmenu		" Autocomplete commands for example file names
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
" Search settings
set incsearch		" Incremental search
set hlsearch		" Use highlight search
nnoremap ,<space> :nohlsearch<CR>	" Turn of hilights with ,<space>

"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Fold settings
set foldenable		" Enable folding
set foldlevelstart=10	" open most folds by default
nnoremap <space> za	" Use space to fold/unfold
set foldmethod=syntax	" Setting fold method

nnoremap gV `[V`]	" highlight last inserted text

" Leader shortcuts
let mapleader=","
inoremap jk <esc> 	" use jk instead of escape 

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>	" Super undo

nnoremap <leader>s :!mksession<CR>	" Super safe

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

