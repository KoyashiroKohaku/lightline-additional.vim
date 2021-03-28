function! llu#fugitive#gitbranch()
  if ! exists('*FugitiveHead')
    return ''
  endif

  let l:branch_name = FugitiveHead()
  if ! strlen(l:branch_name)
    return ''
  endif

  if ! exists('g:llu_git_sign')
    return l:branch_name
  endif

  return g:llu_git_sign . ' ' . l:branch_name
endfunction
