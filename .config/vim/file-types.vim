" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Fastfile,Appfile}    set ft=ruby

" Semantic's .variables and .overrides are Less
au BufRead,BufNewFile {*.variables,*.overrides}    set ft=less

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" make uses real tabs
au FileType make set noexpandtab

" .md is markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Enable flow typing in vim-javascript
let g:javascript_plugin_flow = 1

" Ruby debugging shortcuts
iab d\ require 'rubygems'; require 'ruby-debug'; Debugger.settings[:autoeval] = true; debugger; 1; # FIXME
iab p\ require 'pry'; binding.pry # FIXME
