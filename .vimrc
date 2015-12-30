"Vundle config
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()
Bundle 'gmarik/vundle'
"my Vundle config:
Bundle 'altercation/vim-colors-solarized'
"Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'winmanager'
Bundle 'taglist.vim'
Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
Bundle 'grep.vim'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'L9'
Bundle 'sparkup'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
"Bundle 'virtualmark'
"Brief help of vundle
	":BundleList
	":BundleInstall
	":BundleSearch
	":BundleClean
	":help vundle
"End brief help

"color
hi Comment ctermbg=darkgrey ctermfg=NONE
"hi Search ctermbg=0 ctermfg=3
hi Directory term=bold cterm=bold ctermfg=4
hi SpecialKey term=bold ctermfg=5

"Show line number, command, status line and so on
set history=1000
set ruler
set number
set showcmd
set showmode
set laststatus=2
set cmdheight=2
set scrolloff=3
set tw=0

"Turn off annoying error sound
set noerrorbells
set novisualbell
set t_vb=

"Turn off splash screen
set shortmess=atI

"syntax and theme
syntax enable
syntax on
set background=dark
set cursorline
set cursorcolumn

"Configure backspace to be able to across two lines
set backspace=2
set whichwrap+=<,>,h,l

"Tab and indent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set cindent

"Files,backups and encoding
set nobackup
set noswapfile
set autoread
set autowrite
set fileencodings=utf-8
set fileformats=unix,dos,mac
filetype plugin on
filetype indent on

"Text search and replace
set showmatch
set matchtime=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic
set lazyredraw
set nowrapscan
set iskeyword+=_,$,@,%,#,-,.

"Gvim config
if has("gui_running")
	colorscheme solarized
endif
set guifont=DejaVu\ Sans\ Mono\ 15
set guioptions=aegic

"find highlight word
nmap <F8> /<C-R>=expand("<cword>")<CR><CR><S-n>
nmap <F7> :noh<CR>

"powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8

"cscope setting
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
if filereadable("cscope.out")
    cs add cscope.out
endif
"
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>

"tagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:bufExplorerMaxHeight=30

"winManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>

"miniBufExolorer
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplMaxSize=3
let g:bufExplorerMaxHeight=30

"lookupfile
let g:LookupFile_MinPatLength=3
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0
let g:LookupFile_SortMethod=""

"grep
nnoremap <silent> <F3> :Rgrep<CR>

"visualMark

"superTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"quick input
abbr #p printk("[%s][%d]\n", __FUNCTION__, __LINE__);

