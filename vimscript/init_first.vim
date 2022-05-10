" ----------========== VimWiki ==========--------- "
let g:vimwiki_list = [{'path': '~/ts/journal/',
                     \ 'name': 'Trading Journal', 
                     \ 'syntax': 'markdown', 'ext': '.md',
                     \ 'auto_toc': 1,
                     \ 'auto_tags': 1,
                     \ 'auto_diary_index': 1,
                     \ 'auto_generate_links': 1,
                     \ 'auto_generate_tags': 1,
                     \ 'diary_frequency': 'daily',
                     \ 'diary_start_week_day': 'sunday',
                     \ 'diary_rel_path': 'diary/',
                     \ 'diary_index': 'journal',
                     \ 'diary_header': 'Trading Journal',
                     \ 'bullet_types': ['-', '+', '*'],
                     \ 'listsyms': ' .○◐●X',
                     \ 'listsym_rejected':'-',
                     \ 'exclude_files': ['**/README.md'],
                     \ }]

" Regular expression used to highlight different TODO words.
" let g:vimwiki-option-rx_todo = '\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>'

" let g:vimwiki_syntax_list['markdown']['bullet_type'] = ['-', '+', '*']

" Highlight checked list items with a special color:
" 
"   * [X] the whole line can be highlighted with the option set to 1.
"     * this line is highlighted as well with the option set to 2
"   * [ ] this line is never highlighted
" 
" Value           Description~
" 0               Don't highlight anything.
" 1               Highlight only the first line of a checked [X] list item.
" 2               Highlight a complete checked list item and all its child items.
let g:vimwiki_hl_cb_checked = 1
" let g:vimwiki_listsyms = '✗○◐●✓'
" let g:vimwiki_listsym_rejected = '✗'

" Conceal preformatted text markers
let g:vimwiki_conceal_pre = 1

let g:vimwiki_autowriteall = 1

let g:vimwiki_map_prefix = '<Leader>n'
let g:vimwiki_auto_chdir = 0
let g:vimwiki_auto_header = 1

" A dictionary that is used to enable/disable various key mapping groups.
" The global hotkeys are moved to register_n in which-key
let g:vimwiki_key_mappings =
  \ {
  \   'all_maps': 1,
  \   'global': 0,
  \   'headers': 1,
  \   'text_objs': 1,
  \   'table_format': 1,
  \   'table_mappings': 1,
  \   'lists': 1,
  \   'links': 1,
  \   'html': 0,
  \   'mouse': 0,
  \ }

let g:vimwiki_toc_header = "Contents"
