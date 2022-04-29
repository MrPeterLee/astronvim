" ----------========== Table-Mode ==========--------- "

" Create tables on-the-fly by pressing || or __:
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ----------========== Vimwiki ==========--------- "
" nnoremap <leader>n. :VimwikiToggleListItem<CR>
nnoremap g. :VimwikiToggleListItem<CR>
nnoremap gl. :VimwikiRemoveSingleCB<CR>
nnoremap gL. :VimwikiRemoveCBInList<CR>

" ----------========== Copilot Key Bindings ==========--------- "
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-F> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
