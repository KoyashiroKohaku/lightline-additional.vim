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

function! llu#filetype() abort
  let l:filetype = get(s:filetype_dic, &filetype, &filetype)
  try
    let l:file_type_icon = WebDevIconsGetFileTypeSymbol()
  catch
    return l:filetype
  endtry
  return l:file_type_icon . ' ' . l:filetype
endfunction

function! llu#lineinfo()
  let l:lineinfo = 'L' . line('.') . ':C' . col('.')
  let l:padding = repeat(' ', 6 - len(l:lineinfo))
  return l:padding . l:lineinfo
endfunction
