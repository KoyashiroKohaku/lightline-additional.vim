function! lightline#additional#fugitive#get_head_branch()
  if ! exists('*FugitiveHead')
    return ''
  endif

  let l:head = FugitiveHead()
  if ! strlen(l:head)
    return ''
  endif

  if ! exists('g:lightline_additional_git_sign')
    return l:head
  endif

  return g:lightline_additional_git_sign . ' ' . l:head
endfunction
