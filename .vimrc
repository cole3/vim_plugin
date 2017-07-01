" Fisa-vim-config
" http://fisadev.github.io/fisa-vim-config/
" version: 8.2

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Plugins from github repos:

" Override configs by directory 
Plug 'arielrossanigo/dir-configs-override.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
Plug 'kien/tabman.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Plug 'rosenfeld/conque-term'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Surround
Plug 'tpope/vim-surround'
" Autoclose
Plug 'Townk/vim-autoclose'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Better autocompletion
Plug 'Shougo/neocomplcache.vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
" Drag visual blocks arround
Plug 'fisadev/dragvisuals.vim'
" Window chooser
Plug 't9md/vim-choosewin'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" Search results counter
Plug 'IndexedSearch'
" Gvim colorscheme
Plug 'Wombat'
" Yank history navigation, copy history
Plug 'YankRing.vim'
" quick motion
Plug 'Lokaltog/vim-easymotion'
" recently opened files
Plug 'vim-scripts/mru.vim'
" multiple cursors
Plug 'terryma/vim-multiple-cursors'
" mark for highlight word
Plug 'dimasg/vim-mark'
" lookupfile need it
Plug 'vim-scripts/genutils'
" find file
Plug 'vim-scripts/lookupfile'
" solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set history=1000
set ruler
set showcmd
set showmode
set laststatus=2
set cmdheight=1
set scrolloff=3
set tw=0
" recover terminal state
"set term=screen

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set number

"Files,backups and encoding
set autoread
set autowrite
set fileencodings=utf-8
set fileformats=unix,dos,mac

"Text search and replace
set showmatch
set matchtime=2
set ignorecase
set smartcase
set magic
set lazyredraw
set nowrapscan
set iskeyword+=@,48-57,_,192-255

set background=dark
if has("gui_running")
    "Gvim config
	"colorscheme desert 
	colorscheme solarized
elseif (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nivm')
    "use 256 colors when possible
    let &t_Co = 256
    "colorscheme fisa
    colorscheme desert
    "colorscheme solarized
else
    colorscheme delek
endif

set guifont=DejaVu\ Sans\ Mono\ 13
set guioptions=aegic
"hide/show toolbar(T), menubar(m) and right_scrollbar(r)
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"redefine leader key
let g:mapleader=" "

"cscope setting
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
if filereadable("cscope.out")
    cs add cscope.out
endif
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>

nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
" priv & next
nmap <leader>0 :cn<CR>
nmap <leader>9 :cp<CR>

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tc :tabc<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>

" navigate windows with meta+arrows
map <C-l> <c-w>l
map <C-h> <c-w>h
map <C-k> <c-w>k
map <C-j> <c-w>j
imap <C-l> <ESC><c-w>l
imap <C-h> <ESC><c-w>h
imap <C-k> <ESC><c-w>k
imap <C-j> <ESC><c-w>j

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" simple recursive grep
nmap <leader>r :grep
nmap <leader>wr :grep <cword> ./ -rn<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

" Jumo to privious position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif


" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 
let g:tagbar_left = 1
" toggle tagbar display
map <F6> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 
" toggle nerdtree display
map <F9> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <leader>t :NERDTreeFind<CR>
" Mark this file
map <leader><F9> :Bookmark 
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.o$']
" Use these variables in your vimrc
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
" Show book mark
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos="right"

" Tasklist ------------------------------
" show pending tasks list
map <F10> :TaskList<CR>

" CtrlP ------------------------------
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.o$\|\.so$\|\.ko$\|\.bin$\|\.pkg$',
  \ }

" Syntastic ------------------------------
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)

" NeoComplCache ------------------------------
" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------
" mappings to move blocks in 4 directions
vmap <expr> <C-LEFT> DVB_Drag('left')
vmap <expr> <C-RIGHT> DVB_Drag('right')
vmap <expr> <C-DOWN> DVB_Drag('down')
vmap <expr> <C-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------
" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'cool'
let g:airline#extensions#whitespace#enabled = 0

" easymotion
let g:EasyMotion_smartcase = 1

" mru -- Most Recently Used
nmap <leader>l :MRU<CR>

"find highlight word
nmap <F8> /<C-R>=expand("<cword>")<CR><CR><S-n>
nmap <F7> :noh<CR>

" lookupfile
let g:LookupFile_MinPatLength = 3
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
"LookupFile default use F5
nmap <leader>f :LookupFile<CR>

"quick input
abbr #p printk("[%s][%d]\n", __FUNCTION__, __LINE__);
abbr #f printf("[%s][%d]\n", __FUNCTION__, __LINE__);

