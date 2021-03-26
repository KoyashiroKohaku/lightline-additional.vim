function! llu#fugitive#gitbranch()
  try
    let l:branch_name = FugitiveHead()
  catch
    return ''
  endtry

  if strlen(l:branch_name)
    return g:llu_git_sign . ' ' . l:branch_name
  else
    return ''
  endif
endfunction
