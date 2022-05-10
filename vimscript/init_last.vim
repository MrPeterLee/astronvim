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

" ----------========== CSV.vim  ==========--------- "
let b:csv_arrange_align = 'lc.'
let b:csv_arrange_use_all_rows = 1
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024*100  " autoformat up to 100MB
let g:no_plugin_maps = 1  " Disable all keymaps


" ----------========== Make Vimwiki able to open csv files outside-of-vimwiki folder  ==========--------- "
"
function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    " Choice of 3 methods --> prefer the csv.vim as it is native inside nvim

    " Method 1:: Use csv.vim to edit the csv file
    exe 'e' fnameescape(link_infos.filename)
    " select all lines and format the columns
    " exe '<,'>ArrangeColumn

    " Method 2:: Use VisiData to open csv files
    " let g:vimwiki_link_path = fnameescape(link_infos.filename)
    " echo "vd " . g:vimwiki_link_path
    " lua require("core.utils").toggle_term_cmd ({ cmd = "vd " .. vim.g.vimwiki_link_path, direction = "tab", })

    " Method 3:: Use sc-im to open csv files
    " let g:vimwiki_link_path = fnameescape(link_infos.filename)
    " echo "sc-im " . g:vimwiki_link_path
    " lua require("core.utils").toggle_term_cmd ({ cmd = "sc-im " .. vim.g.vimwiki_link_path, direction = "tab", insert_mappings=false, terminal_mappings=false, close_on_exit=true})

    return 1
  endif
endfunction


