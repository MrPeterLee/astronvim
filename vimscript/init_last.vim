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
let g:copilot_no_tab_map = v:true
" imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")

" ----------========== Other Key Bindings ==========--------- "
" Map s -> wincmd
nnoremap s <C-w>
vnoremap s <C-w>
