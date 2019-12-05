" Color Schemes / UI
color gruvbox

"" Airline
let g:airline_powerline_fonts = 1

" File Types / Syntax / Language Support
"" vim-javascript
let g:javascript_plugin_jsdoc = 1

"" NERDCommenter
let g:NERDDefaultAlign = 'left'

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" File Navigation
"" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Linting
"" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_javascript_flow_exe = 'yarn run flow'
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'MoreMsg',
            \ }
call neomake#configure#automake('rw')

let g:flow#enable = 0

if executable($PWD .'/node_modules/.bin/flow')
  let g:flow#flowpath = $PWD .'/node_modules/.bin/flow'
else
  let g:flow#flowpath = 'flow'
endif

if executable('flow-language-server')
  " vim-lsp
  "
  " au User lsp_setup call lsp#register_server({
      " \ 'name': 'flow-language-server',
      " \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --try-flow-bin --stdio']},
      " \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
      " \ 'whitelist': ['javascript'],
      " \ })

  " LanguageClient-neovim
  let g:LanguageClient_serverCommands = {
      \ 'javascript': ['flow-language-server', '--try-flow-bin', '--stdio'],
      \ 'javascript.jsx': ['flow-language-server', '--try-flow-bin', '--stdio'],
      \ }

  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endif

" Editing
"" NERD Commenter
let g:NERDSpaceDelims = 1
"" NERD Tree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
"" vim-better-whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave

" External Tools
"" gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" Completion
"" deoplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'

  " let g:deoplete#omni#functions = {}
  " let g:deoplete#omni#functions.javascript = [
    " \ 'tern#Complete',
    " \ 'jspc#omni'
  " \]

  let g:deoplete#buffer#require_same_filetype = 0

  set completeopt=longest,menuone,preview

  " let g:tern#command = ['tern']
  " let g:tern#arguments = ['--persistent']
  let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
else
endif

