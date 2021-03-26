function! llu#lsp#diagnostic_info()
  try
    let l:counts = lsp#get_buffer_diagnostics_counts()
  catch
    return ''
  endtry

  let l:error_count = get(l:counts, 'error', 0)
  let l:warning_count = get(l:counts, 'warning', 0)

  return join([g:lsp_error_sign, l:error_count, g:lsp_warning_sign, l:warning_count], ' ')
endfunction
