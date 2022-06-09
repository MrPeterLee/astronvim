" ----------========== Python Skeleton ==========--------- "
" Python Configurations
" Auto create python file skeleton
autocmd BufNewFile  *.py	0r ~/.config/nvim/skeleton/skeleton.py


" ----------========== Jupyter Notebook: Jupyter_Ascending ==========--------- "
fun MoveToPreviousBlock()
  " Move the current cursort to the previous code block (heading identifier: `# %%`)
  silent! eval search('# %%', 'b')
  silent! eval search('# %%', 'b')
  normal j
endfun
fun MoveToNextBlock()
  " Move the current cursort to the next code block (heading identifier: `# %%`)
  silent! eval search('# %%')
  normal j
endfun
" Configure hotkeys when editing Jupyter Notebook sync files
function! SetupJupyterNotebookSync()
  nnoremap <buffer> <F12> :silent write \|\| call jupyter_ascending#execute() <ENTER>
  inoremap <buffer> <F12> <C-O>:silent write \|\| call jupyter_ascending#execute() <ENTER>
  nnoremap <buffer> <F10> :silent write \|\| call jupyter_ascending#execute() \|\| call MoveToNextBlock() <ENTER><ENTER>
  inoremap <buffer> <F10> <C-O>:silent write \|\| call jupyter_ascending#execute() \|\| call MoveToNextBlock() <ENTER><ENTER>

  nnoremap <buffer> <C-Enter> :silent write \|\| call jupyter_ascending#execute() <ENTER>
  inoremap <buffer> <C-Enter> <C-O>:silent write \|\| call jupyter_ascending#execute() <ENTER>

  " Move around ## % blocks using hotkey
  nnoremap <buffer> { :call MoveToPreviousBlock() <CR>
  nnoremap <buffer> } :call MoveToNextBlock() <CR>
endfunction
autocmd BufRead,BufNewFile *.sync.py call SetupJupyterNotebookSync()

" ----------========== Update `last_update` datetime in Python Header ==========--------- "
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


" ----------========== Markdown Configurations ==========--------- "
autocmd FileType markdown setlocal spell
" Disable cmp auto-complete for markdown
autocmd FileType markdown lua require'cmp'.setup.buffer {
\   completion = { autocomplete = false }
\ }


" ----------========== Misc ==========--------- "
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
