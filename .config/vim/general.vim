" Set encoding
set enc=utf-8
set fenc=utf-8

set termguicolors

set exrc
set secure

" Check for changes on focus
autocmd BufEnter,FocusGained * checktime
set autoread

autocmd Syntax ruby,javascript,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax ruby,javascript,vim,xml,html,xhtml normal zR

syntax on
set background=dark

set number " line numbering

set hidden

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:▸\ ,trail:·,eol:¬

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set iskeyword-=.

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,tmp/*

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set undofile

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

hi HitSign ctermfg=6 cterm=bold gui=bold guifg=#b2f594
hi MissSign ctermfg=Red cterm=bold gui=bold guifg=#ab89c8
hi IgnoredSign ctermfg=6 cterm=bold gui=bold guifg=#222222

sign define hit linehl=HitLine texthl=HitSign text=┃
sign define miss linehl=MissLine texthl=MissSign text=┃
sign define ignored linehl=IgnoredLine texthl=IgnoredSign text=┋
