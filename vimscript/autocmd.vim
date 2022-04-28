autocmd BufNewFile  *.py	0r ~/.config/nvim/skeleton/skeleton.py

autocmd BufWritePre,FileWritePre *.py   ks|call LastMod()|'s
fun LastMod()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  exe "1," .. l .. "g/last_update: /s/last_update: .*/last_update:   " ..
  \ strftime("%Y-%b-%d %H:%M:%S")
  exe "1," .. l .. "g/id: /s/id: .*/id:            Peter Lee (peter.lee@finclab.com)"
endfun

