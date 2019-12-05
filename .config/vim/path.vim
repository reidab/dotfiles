" Set rbenv root.
if empty($RBENV_ROOT)
  let s:rbenv_root = $HOME . '/.rbenv'
else
  let s:rbenv_root = $RBENV_ROOT
endif

if isdirectory(s:rbenv_root)
  " Add rbenv bin to path.
  let s:rbenv_bin = s:rbenv_root . '/bin'
  let $PATH = substitute($PATH, ':' . s:rbenv_bin, '', '')
  let $PATH = s:rbenv_bin . ':' . $PATH

  " Add rbenv shims to path.
  let s:rbenv_shims = s:rbenv_root . '/shims'
  let $PATH = substitute($PATH, ':' . s:rbenv_shims, '', '')
  let $PATH = s:rbenv_shims . ':' . $PATH
endif
