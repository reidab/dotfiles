set nocompatible

" source ~/.config/vim/plugins.vim
" source ~/.config/vim/plugin-config.vim
source ~/.config/vim/general.vim
source ~/.config/vim/keys.vim
source ~/.config/vim/status.vim
source ~/.config/vim/file-types.vim
source ~/.config/vim/gui.vim

" call plug#begin('~/.vim/plugged')

" Plug 'ctrlpvim/ctrlp.vim'
"Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'

" Plug 'ervandew/supertab'
" vs. YCM

" call plug#end()

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set undodir=~/.vim/undo

" --[ Plugin Configuration ]---------------------------------------------------

let g:easytags_async = 1

let g:easytags_languages = {
\   'javascript': {
\     'cmd': 'es-ctags',
\       'args': ['--exclude=node_modules', '--exclude=tmp', '--exclude=dist'],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}

map <Leader>jt :! es-ctags --exclude=node_modules --exclude=bower_components --exclude=tmp --exclude=dist -R .<CR>

hi MyWarningMsg ctermbg=3 ctermfg=0

autocmd! BufWritePost * Neomake

map <Leader>r :lw<CR>
map <Leader>a :ll<CR>
map <Leader>q :lprev<CR>
map <Leader>q :lnext<CR>

" CtrlP configuration
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist|tmp|vendor/bundle)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_window = 'order:ttb'
let g:ctrlp_switch_buffer = 'et'

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

