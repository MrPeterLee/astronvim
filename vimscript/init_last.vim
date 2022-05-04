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


" ----------========== Other Key Bindings ==========--------- "
" Map s -> wincmd
" nnoremap s <C-w>
" vnoremap s <C-w>


" ----------========== function GetSyntax:: Show highlight info for cursor ==========--------- "
function! GetSyntaxID()
    return synID(line('.'), col('.'), 1)
endfunction

function! GetSyntaxParentID()
    return synIDtrans(GetSyntaxID())
endfunction

function! GetSyntax()
    echo synIDattr(GetSyntaxID(), 'name')
    exec "hi ".synIDattr(GetSyntaxParentID(), 'name')
endfunction


