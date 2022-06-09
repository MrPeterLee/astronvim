return {
	setup = function()
		local map = vim.keymap.set

		-- local unmap = vim.keymap.del
		-- remove key-bindings
		--unmap("n", "<A-j>")
		--unmap("n", "<A-k>")
		--unmap("n", "<C-Down>")
		--unmap("n", "<C-Left>")
		--unmap("n", "<C-Right>")
		--unmap("n", "<C-Up>")
		--unmap("n", "<C-\\>")
		--unmap("n", "<C-q>")
		--unmap("n", "<C-s>")
		--unmap("v", "<A-j>")
		--unmap("v", "<A-k>")
		--unmap("v", "<")
		--unmap("v", ">")
		--unmap("v", "J")
		--unmap("v", "K")
		--unmap("n", "<A-j>")

		-- Move buffers
		map("n", ">", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
		map("n", "<", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
		map("n", "M", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin Buffer" })

		-- select python method / class
		vim.cmd([[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]])
		vim.cmd([[vnoremap <silent> m :lua require('tsht').nodes()<CR>]])

		-- Send line to ToggleTerm
		vim.cmd([[ nnoremap <C-Enter> :silent write \|\| ToggleTermSendCurrentLine <ENTER> ]])
		vim.cmd([[ inoremap <C-Enter> <C-O>:silent write \|\| ToggleTermSendCurrentLine <ENTER> ]])
		vim.cmd([[ vnoremap <C-Enter> :ToggleTermSendVisualLines <ENTER> ]])
		vim.cmd([[ nnoremap <F12> :silent write \|\| ToggleTermSendCurrentLine <ENTER> ]])
		vim.cmd([[ inoremap <F12> <C-O>:silent write \|\| ToggleTermSendCurrentLine <ENTER> ]])
		vim.cmd([[ vnoremap <F12> :ToggleTermSendVisualLines <ENTER> ]])

		-- Toggle Term
		map(
			"n",
			"<C-t>",
			[[<C-\><C-n><Esc>:silent ToggleTerm direction='float'<CR>]],
			{ desc = "Open Terminal (Vertical)", noremap = true }
		)
		map(
			"n",
			"<C-\\>",
			[[<C-\><C-n><Esc>:silent ToggleTerm direction='vertical'<CR>]],
			{ desc = "Open Terminal (Float)", noremap = true }
		)

		-- hop
		vim.cmd([[ hi HopNextKey cterm=bold ctermfg=198 gui=bold guifg=#ff007c]])
		vim.cmd([[ hi HopNextKey1 cterm=bold ctermfg=198 gui=bold guifg=#ff007c]])
		vim.cmd([[ hi HopNextKey2 cterm=bold ctermfg=198 gui=bold guifg=#ff007c]])
		map("n", "f", "<cmd>HopChar1CurrentLineAC<cr>", { noremap = true })
		map("n", "t", "<cmd>lua require'hop'.hint_char2()<cr>", { noremap = true })
		map("v", "f", "<cmd>HopChar1CurrentLineAC<cr>", { noremap = true })
		map("v", "t", "<cmd>lua require'hop'.hint_char2()<cr>", { noremap = true })

		-- move current line up and down
		-- map("n", "<C-k>", ":m .-2<CR>==", { desc = "Switch line up" })
		-- map("n", "<C-j>", ":m .+1<CR>==", { desc = "Switch line down" })
		-- map("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { desc = "Switch line up" })
		-- map("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { desc = "Switch line down" })
		map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Switch line up" })
		map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Switch line down" })

		-- tmux navigation
		map("i", "<A-h>", '<Esc>:lua require("tmux").move_left()<CR>', { desc = "Tmux navigate left" })
		map("i", "<A-l>", '<Esc>:lua require("tmux").move_right() <CR>', { desc = "Tmux navigate right" })
		map("i", "<A-j>", '<Esc>:lua require("tmux").move_bottom()<CR>', { desc = "Tmux navigate bottom" })
		map("i", "<A-k>", '<Esc>:lua require("tmux").move_top()<CR>', { desc = "Tmux navigate up" })
		map("n", "<A-h>", function()
			require("tmux").move_left()
		end, { desc = "Tmux navigate left" })
		map("n", "<A-l>", function()
			require("tmux").move_right()
		end, { desc = "Tmux navigate right" })
		map("n", "<A-j>", function()
			require("tmux").move_bottom()
		end, { desc = "Tmux navigate bottom" })
		map("n", "<A-k>", function()
			require("tmux").move_top()
		end, { desc = "Tmux navigate up" })
		-- tmux resize
		map("n", "<A-H>", function()
			require("tmux").resize_left()
		end, { desc = "Tmux resize left" })
		map("n", "<A-L>", function()
			require("tmux").resize_right()
		end, { desc = "Tmux resize right" })
		map("n", "<A-J>", function()
			require("tmux").resize_bottom()
		end, { desc = "Tmux resize bottom" })
		map("n", "<A-K>", function()
			require("tmux").resize_top()
		end, { desc = "Tmux resize up" })

		-- - swap `;` with `:` - causing conflict with telescope
		-- map("n", ";", ":", { desc = "Swap `;` with `:`" })
		-- map("n", ":", ";", { desc = "Swap `;` with `:`" })
		-- map("v", ";", ":", { desc = "Swap `;` with `:`" })
		-- map("v", ":", ";", { desc = "Swap `;` with `:`" })
		--
		-- navigating wrapped lines
		map({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
		map({ "n", "v" }, "k", "gk", { desc = "Navigate up" })
		-- easy splits
		map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
		map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
		-- better increment/decrement
		map("n", "-", "<c-x>", { desc = "Descrement number" })
		map("n", "+", "<c-a>", { desc = "Increment number" })
		map("x", "+", "g<c-a>", { desc = "Increment number" })
		map("x", "-", "g<c-x>", { desc = "Descrement number" })
		-- line text-objects
		map("x", "il", "g_o^", { desc = "Inside line text object" })
		map("o", "il", ":normal vil<cr>", { desc = "Inside line text object" })
		map("x", "al", "$o^", { desc = "Around line text object" })
		map("o", "al", ":normal val<cr>", { desc = "Around line text object" })

		map("i", "<S-Tab>", "<C-V><Tab>", { desc = "Tab character" })

		-- terminal mappings
		-- map("t", "<leader><esc>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
		-- map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quit" })

		-- Buffer switching
		map(
			"n",
			"<leader>1",
			"<Cmd>BufferLineGoToBuffer 1<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>2",
			"<Cmd>BufferLineGoToBuffer 2<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>3",
			"<Cmd>BufferLineGoToBuffer 3<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>4",
			"<Cmd>BufferLineGoToBuffer 4<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>5",
			"<Cmd>BufferLineGoToBuffer 5<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>6",
			"<Cmd>BufferLineGoToBuffer 6<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>7",
			"<Cmd>BufferLineGoToBuffer 7<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>8",
			"<Cmd>BufferLineGoToBuffer 8<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>9",
			"<Cmd>BufferLineGoToBuffer 9<CR>",
			{ desc = "Swtch to buffer 1", noremap = true, silent = true }
		)

		-- cmp lsp auto complete
		map("i", "<c-x><c-o>", function()
			require("cmp").complete({ config = { sources = { { name = "nvim_lsp" } } } })
		end, { desc = "Complete LSP" })

		map("", "<c-e><c-e>", "<Plug>SendLine", { desc = "Send line to REPL" })
		map("", "<c-e>", "<Plug>Send", { desc = "Send to REPL" })
	end,
}
