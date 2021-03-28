function! llu#fugitive#get_head_branch()
  if ! exists('*FugitiveHead')
    return ''
  endif

  let l:head = FugitiveHead()
  if ! strlen(l:head)
    return ''
  endif

  if ! exists('g:llu_git_sign')
    return l:head
  endif

  return g:llu_git_sign . ' ' . l:head
endfunction
