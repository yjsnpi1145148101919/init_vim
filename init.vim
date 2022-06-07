let g:python3_host_prog = system('which python3')
"set ambiwidth=double
set autoindent
set autoread
set noautowrite
set backspace=indent,eol,start
set nobackup
set breakindentopt=min:20,shift:0
set bufhidden=hide
set casemap=internal
set splitbelow
set nocindent
"set cinkeys
"set cinoptions+=:0
"set cinwords
"set termwinkey=<F2>
set clipboard=unnamed
set cmdheight=2
set cmdwinheight=5
"set completeslash
set completeopt=menuone,preview
set copyindent
set cursorcolumn
set cursorline
set display=uhex
set eadirection=both
set emoji
set encoding=utf-8
set noerrorbells
set equalalways
"set expandtab
"set fileencoding=utf-8
"set fileencodings=cp931,sjis
set fileformat=unix
set fileignorecase
"set helpheight
"set helplang
set history=50
set hidden
set hlsearch
set ignorecase
set noimcmdline
"set include=/pattern/
set incsearch
set infercase "?
set laststatus=2
set list listchars=eol:$,tab:>-,trail:~,precedes:@,nbsp:&
set loadplugins
"set makeencoding=utf-8
set matchpairs+=<:>,「:」,｛:｝,【:】,（:）
set mouse=a
set nrformats=alpha,octal,hex,bin
set number
set nopaste
set pastetoggle=<F1>
set preserveindent
"set previewheight=12
set pumheight=0
set relativenumber
set ruler
set scrolljump=-30
set scrolloff=3
set selection=inclusive
set selectmode=mouse
"set shellslash "windowos
"set shiftwidth=4
set showbreak=\
set showcmd
set showfulltag "?
set showmatch matchtime=1
set showmode
set showtabline=2
set smartcase
set indentkeys
set smartindent
set smarttab
"set softtabstop=4
"set spell
"set spelloptions=camel
set spellsuggest=fast
"set splitbelow
set splitright
set startofline "?
set noswapfile
"set switchbuf=usetab
set syntax=ON
"set tabstop=4
set tagbsearch
set tagcase=smart
"set termwintype
set timeout
set ttimeout
set title
set ttyfast
set virtualedit=onemore,block
set whichwrap=b,s,h,l,<,>,[,],~
"set wildchar
"set wildcharm
set wildignorecase
"set wildmenu
set wildmode=list:longest
set wrap
set wrapscan
set nowritebackup
set updatetime=400
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif


if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd FileType * setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python setlocal sw=4 sts=4 ts=4 et
endif

tnoremap jj <C-\><C-N>

let mapleader="\<Space>"

nnoremap <Leader>a ggVG
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :Lex<CR>
nnoremap <Leader>l $
nnoremap <Leader>h ^
nnoremap <Leader>f :%s/<C-r><C-w>//g<LEFT><LEFT>

nnoremap <silent> j gj
nnoremap <silent> k gk
inoremap <silent> jj <ESC>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <C-E><left> <C-W>>
nnoremap <silent> <C-E><right> <C-W><
nnoremap <silent> <C-E><up> <C-W>-
nnoremap <silent> <C-E><down> <C-W>+
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nmap <silent> <C-q> :bd<CR>
nnoremap <Leader>binary :%!xxd<CR>
nnoremap <Leader>binaryq :%!xxd -r<CR>

"remember current cursor pos
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup ENDnoremap ' ''<LEFT>


"auto predict file encoding
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif

if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif





"dein Scripts-----------------------------
"if &compatible
"  set nocompatible               " Be iMproved
"endif


" Required:
set runtimepath+=~/.cache/dein/./repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein/.')

" Let dein manage dein
" Required:
call dein#add('~/.cache/dein/./repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')


let s:toml_dir = $HOME . '/.config/nvim/toml'
call dein#load_toml(s:toml_dir . '/util.toml', {'lazy': 1})
call dein#load_toml(s:toml_dir . '/essential.toml', {'lazy': 0})
call dein#load_toml(s:toml_dir . '/markdown.toml', {'lazy': 2})
call dein#load_toml(s:toml_dir . '/complete.toml', {'lazy': 3})
call dein#load_toml(s:toml_dir . '/debug.toml', {'lazy': 7})
call dein#load_toml(s:toml_dir . '/colorscheme.toml',{'lazy': 8})
call dein#load_toml(s:toml_dir . '/game.toml',{'lazy': 9})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"
"let g:dein#auto_recache = 1

"End dein Scripts-------------------------

