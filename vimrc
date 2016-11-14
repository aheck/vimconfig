" Configuration file for gvim
" Written for Debian GNU/Linux by W.Akkerman <wakkerma@debian.org>
" Some modifications by J.H.M. Dassen <jdassen@wi.LeidenUniv.nl>


" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults (much better!)
set bs=2 		" allow backspacing over everything in insert mode
" Now we set some defaults for the editor 
"set autoindent		" always set autoindenting on

let mapleader=","

set encoding=utf-8
set autoread
set visualbell
set t_Co=256
colorscheme summerfruit

" Only 80 columns!!!
set textwidth=80

" setup autoindent
set et
set sw=2
"set smarttab

set spelllang=de_de
set nospell

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set hidden

"set nobackup		" Keep a backup file
set backupcopy=yes
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time

set browsedir=buffer

runtime macros/matchit.vim

set wildmode=list:longest

set ignorecase
set smartcase

set scrolloff=3

" Folding
set foldmethod=syntax
set foldnestmax=1

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if has("syntax")
  syntax on		" Default to no syntax highlightning 
endif

set ts=4
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  augroup C
    autocmd BufRead *.c,*.cpp,*.h set cindent
  augroup END
endif

if has("autocmd")
    autocmd Syntax * normal zr
" Set some sensible defaults for editing C-files
"augroup cprog
  " Remove all cprog autocommands
"  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
"  autocmd BufRead *       set formatoptions=tcql nocindent comments&
"  autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"augroup END

endif " has ("autocmd")

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
set hlsearch
set autowrite		" Automatically save before commands like :next and :make

filetype on
filetype indent on
filetype plugin on

" Konvertierung von Quellcode (mit Syntax Highlightning) nach HTML
" Aufruf durch: :runtime! syntax/2html.vim
let html_number_lines = 1
let html_use_css = 1
let use_xhtml = 1

au BufRead,BufNewFile *.bf set filetype=brainfuck
au! Syntax brainfuck source $VIM/vim62/syntax/brainfuck.vim

" error format for ant
setlocal efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,%A\ %#[javac]\ \%f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

set omnifunc=javacomplete#Complete
set completefunc=javacomplete#CompleteParamsInfo

set statusline=%r%h%F\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ %{&ff}
set laststatus=2

match ErrorMsg /\w\+Exception:/

" Vala stuff
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

map <F10> :NERDTreeToggle<RETURN>
map <F12> :TlistToggle<RETURN>

execute pathogen#infect()

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>r <Plug>(go-run)

" disable folding
set nofoldenable
