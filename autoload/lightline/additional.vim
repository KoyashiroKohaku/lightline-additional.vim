function! lightline#additional#get_relative_path()
  let l:relative_path = expand('%:.')
  if empty(l:relative_path)
    return '[No Name]'
  else
    return l:relative_path
  endif
endfunction

let s:encoding_dic = {
  \   'utf-8': 'UTF-8',
  \   'sjis': 'Shift JIS',
  \ }

function! lightline#additional#get_encoding()
  if empty(&fileencoding)
    let l:encoding = &encoding
  else
    let l:encoding = &fileencoding
  endif

  let l:formatted_encoding = get(s:encoding_dic, l:encoding, l:encoding)

  if &bomb
    return l:formatted_encoding . ' with BOMB'
  else
    return l:formatted_encoding
  endif
endfunction

function! lightline#additional#get_eol()
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

let s:filetype_dic = {
  \   'c': 'C',
  \   'cpp': 'C++',
  \   'cs': 'C#',
  \   'fsharp': 'F#',
  \   'dockerfile': 'Dockerfile',
  \   'go': 'Go',
  \   'git': 'Git',
  \   'gitcommit': 'Git Commit Message',
  \   'gitrebase': 'Git Rebase Message',
  \   'html': 'HTML',
  \   'json': 'Json',
  \   'javascript': 'JavaScript',
  \   'javascriptreact': 'React',
  \   'kotlin': 'Kotlin',
  \   'lua': 'Lua',
  \   'markdown': 'Markdown',
  \   'perl': 'Perl',
  \   'php': 'PHP',
  \   'ps1': 'PowerShell',
  \   'python': 'Python',
  \   'ruby': 'Ruby',
  \   'rust': 'Rust',
  \   'sh': 'Shell',
  \   'sql': 'SQL',
  \   'swift': 'Swift',
  \   'typescript': 'TypeScript',
  \   'toml': 'TOML',
  \   'vim': 'Vim',
  \   'vue': 'Vue',
  \   'xml': 'XML',
  \   'yaml': 'YAML',
  \   'zsh': 'Zsh',
  \ }

function! lightline#additional#get_formatted_filetype() abort
  let l:formatted_filetype = get(s:filetype_dic, &filetype, &filetype)
  if empty(l:formatted_filetype)
    let l:formatted_filetype = 'Plain Text'
  endif

  if ! exists('*WebDevIconsGetFileTypeSymbol')
    return l:formatted_filetype
  endif

  return WebDevIconsGetFileTypeSymbol() . ' ' . l:formatted_filetype
endfunction

function! lightline#additional#get_formatted_lineinfo()
  let l:lineinfo = 'L' . line('.') . ':C' . col('.')
  let l:padding = repeat(' ', 6 - len(l:lineinfo))
  return l:padding . l:lineinfo
endfunction
