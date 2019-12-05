" Move by screen line instead of editor line
nnoremap j gj
nnoremap k gk

" Get out of insert mode free
inoremap jj <ESC>
inoremap kk <ESC>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

if has('nvim')
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
endif

" Split Creation
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" LSP

if executable('flow-language-server')
  nnoremap <leader>h :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endif

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Searching
nnoremap / /\v
vnoremap / /\v

" Clear last search term with ESC
nnoremap <esc> :noh<return><esc>

" Keep selection after indenting
vnoremap < <gv
vnoremap > >gv

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

map <C-p> :Files<CR>
imap <C-t> <Esc>:Files<CR>

" --[ GUI Keys ]-----------------------------------------------------------

if has("gui_vimr") || has("gui_macvim")
  " Change indentation with <D-[> and <D-]>
  nnoremap <D-[> <<
  nnoremap <D-]> >>

  " Keep selection after indenting
  vnoremap <D-[> <gv
  vnoremap <D-]> >gv

  map <D-p> :Files<CR>
  imap <D-t> <Esc>:Files<CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

  map <S-D-}> :tabn<CR>
  imap <S-D-}> <Esc>:tabn<CR>
  map <S-D-{> :tabp<CR>
  imap <S-D-{> <Esc>:tabp<CR>

  if has('nvim')
    tnoremap <S-D-}> <C-\><C-N>:tabn<CR>
    tnoremap <S-D-{> <C-\><C-N>:tabp<CR>
  endif
endif

" --[ Plugin Keys ]-----------------------------------------------------------

map <Leader><Leader> :ZoomWin<CR>
map <Leader>n :NERDTreeToggle<CR>
nmap <Leader>] :TagbarToggle<CR>

" Dash
:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch

" Unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" --[ Color Schemes ]---------------------------------------------------------

function! Sunny()
  colorscheme NeoSolarized
  set background=light
endfunction

map <Leader>sun :call Sunny()<CR>
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

function! HighContrast()
  let g:neosolarized_contrast = "high"
  let g:gruvbox_contrast_dark = "hard"
  let g:gruvbox_contrast_light = "hard"
endfunction

function! MediumContrast()
  let g:neosolarized_contrast = "normal"
  let g:gruvbox_contrast_dark = "medium"
  let g:gruvbox_contrast_light = "medium"
endfunction

function! LowContrast()
  let g:neosolarized_contrast = "low"
  let g:gruvbox_contrast_dark = "soft"
  let g:gruvbox_contrast_light = "soft"
endfunction

map <Leader>ch :call HighContrast()<CR>
map <Leader>cm :call MediumContrast()<CR>
map <Leader>cl :call LowContrast()<CR>

