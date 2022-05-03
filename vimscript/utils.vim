function! utils#SwitchLine(src_line_idx, direction) abort
  " Check if the current buffer is modifiable
  if &modifiable
    " Case for normal editing
    if a:direction ==# 'up'
      if a:src_line_idx == 1
          return
      endif
      move-2
    elseif a:direction ==# 'down'
      if a:src_line_idx == line('$')
          return
      endif
      move+1
    endif
  else
    " Case for Neo-Tree buffers
    " If non-modifiable -> Neo-Tree:: map <C-j> to j; <C-k> to k
    if a:direction ==# 'up'
      call feedkeys("\<up>")
    endif
    if a:direction ==# 'down'
      call feedkeys("\<down>")
    endif
  endif
endfunction

