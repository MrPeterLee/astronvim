
" Python Configurations
" Auto create python file skeleton
autocmd BufNewFile  *.py	0r ~/.config/nvim/skeleton/skeleton.py

" Auto format Python files
" autocmd BufWritePre *.py   ks|call FormatPythonFiles()|'s
" fun FormatPythonFiles()
"   exe "silent," .. l .. "g/id: /s/id: .*/id:            Peter Lee (peter.lee@finclab.com)"
" endfun



" Auto update the last-update time
autocmd BufWritePre,FileWritePre *.py   ks|call UpdatePythonHeader()|'s
fun UpdatePythonHeader()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  exe "1," .. l .. "g/last_update: /s/last_update: .*/last_update:   " ..
  \ strftime("%Y-%b-%d %H:%M:%S")
  " exe "1," .. l .. "g/id: /s/id: .*/id:            Peter Lee (peter.lee@finclab.com)"
endfun





autocmd FileType markdown setlocal spell
" Disable cmp auto-complete for markdown
autocmd FileType markdown lua require'cmp'.setup.buffer {
\   completion = { autocomplete = false }
\ }

" augroup formatting 
"   autocmd!
"   autocmd FileType markdown setlocal formatprg=prettier\ --parser\ markdown
"   " autocmd FileType css setlocal formatprg=prettier\ --parser\ css
"   " autocmd FileType html setlocal formatprg=prettier\ --parser\ html
"   " autocmd FileType json setlocal formatprg=prettier\ --parser\ json
" augroup END
" autocmd BufWritePre *.md call feedkeys("mxgggqG'x", "n")

" autocmd GUIEnter * nested FVimCursorSmoothMove v:true

" ks|call GuiInit()|'s
" fun GuiInit()
"   if exists('g:fvim_loaded')
"       FVimCursorSmoothMove v:true
"       FVimCursorSmoothBlink v:true
"   endif
" endfun
