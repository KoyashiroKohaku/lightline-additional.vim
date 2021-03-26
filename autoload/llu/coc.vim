function! llu#coc#diagnostic_info()
  if ! get(g:, 'coc_enabled', 0)
    return ''
  endif

  let l:info = get(b:, 'coc_diagnostic_info', { 'error': 0, 'warning': 0 })
  let l:error_count = get(l:info, 'error', 0)
  let l:warning_count = get(l:info, 'warning', 0)

  return join([g:llu_error_sign, l:error_count, g:llu_warning_sign, l:warning_count], ' ')
endfunction

function! llu#coc#status()
  if ! get(g:, 'coc_enabled', 0)
    return ''
  endif

  return get(g:, 'coc_status', '')
endfunction

