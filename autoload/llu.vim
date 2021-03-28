function! llu#filename()
  let l:name = expand('%:.')
  if l:name ==# ''
    return '[No Name]'
  else
    return l:name
  endif
endfunction

function! llu#fileencoding()
  return toupper(&fileencoding)
endfunction

function! llu#fileformat()
  if &fileformat ==# 'dos'
    return 'CRLF'
  elseif &fileformat ==# 'unix'
    return 'LF'
  elseif &fileformat ==# 'mac'
    return 'CR'
  else
    return &fileformat
  endif
endfunction

function! llu#filetype() abort
  try
    let l:file_type_icon = WebDevIconsGetFileTypeSymbol()
  catch
    return &filetype
  endtry
  return l:file_type_icon . ' ' . &filetype
endfunction
