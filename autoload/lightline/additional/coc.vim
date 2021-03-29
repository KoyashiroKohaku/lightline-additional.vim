function! lightline#additional#coc#get_diagnostic_info()
  if ! get(g:, 'coc_enabled', 0)
    return ''
  endif

  let l:info = get(b:, 'coc_diagnostic_info', { 'error': 0, 'warning': 0 })
  let l:error_count = get(l:info, 'error', 0)
  let l:warning_count = get(l:info, 'warning', 0)

  return join([g:lightline_additional_error_sign, l:error_count, g:lightline_additional_warning_sign, l:warning_count], ' ')
endfunction

function! lightline#additional#coc#get_status()
  if ! get(g:, 'coc_enabled', 0)
    return ''
  endif

  return get(g:, 'coc_status', '')
endfunction
