function! lightline#additional#lsp#get_diagnostic_info()
  if ! exists('*lsp#get_buffer_diagnostics_counts')
    return ''
  endif

  let l:counts = lsp#get_buffer_diagnostics_counts()

  let l:error_count = get(l:counts, 'error', 0)
  let l:warning_count = get(l:counts, 'warning', 0)

  return join([g:lsp_error_sign, l:error_count, g:lsp_warning_sign, l:warning_count], ' ')
endfunction
