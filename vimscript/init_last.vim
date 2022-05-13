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


" ----------========== Markdown-Preview  ==========--------- "
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = '10.1.1.100'

" use a custom port to start server or empty for random
let g:mkdp_port = '50100'

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
  function OpenMarkdownPreview (url)
    " execute "silent ! fuser -k 50100/tcp"
    echom a:url
  endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position always show at the middle of the preview page
"   top: mean the vim top viewport always show at the top of the preview page
"   relative: mean the cursor position always show at the relative position of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'
