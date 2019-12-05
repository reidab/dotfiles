if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Color Schemes / UI
Plug 'morhetz/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'reidab/cool_glow'
Plug 'vim-scripts/habiLight'

Plug 'bling/vim-airline'

" File Types / Syntax / Language Support
Plug 'andrewradev/ember_tools.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'groenewege/vim-less'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mhinz/vim-hugefile'
Plug 'mxw/vim-jsx'
Plug 'rhysd/committia.vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails' " also provides navigation commands
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'davidoc/taskpaper.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'
Plug 'sirtaj/vim-openscad'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" File Navigation
" Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Linting
Plug 'ngmy/vim-rubocop'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'neomake/neomake'
" Plug 'w0rp/ale'

" Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-fnr'
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim' " HTML abbreviation expansion
Plug 'junegunn/vim-easy-align'
Plug 'kabbamine/vCoolor.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/wipeout'

" External Tools
Plug 'rizzatti/dash.vim' " <Leader>d / <Leader>D in keys.vim
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'

" Completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'Shougo/neco-syntax'
else
  Plug 'valloric/youcompleteme'
endif

call plug#end()
