return {
	setup = function()
		local unmap = vim.keymap.del
		local map = vim.keymap.set

		-- remove key-bindings
		unmap("n", "<A-j>")
		unmap("n", "<A-k>")
		unmap("n", "<C-Down>")
		unmap("n", "<C-Left>")
		unmap("n", "<C-Right>")
		unmap("n", "<C-Up>")
		unmap("n", "<C-\\>")
		unmap("n", "<C-q>")
		unmap("n", "<C-s>")
		unmap("v", "<A-j>")
		unmap("v", "<A-k>")
		unmap("v", "<")
		unmap("v", ">")
		unmap("v", "J")
		unmap("v", "K")

		-- select python method / class
		vim.cmd([[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]])
		vim.cmd([[vnoremap <silent> m :lua require('tsht').nodes()<CR>]])

		-- hop
		vim.cmd([[ hi HopNextKey cterm=bold ctermfg=198 gui=bold guifg=#ff007c]])
		vim.cmd([[ hi HopNextKey1 cterm=bold ctermfg=198 gui=bold guifg=#ff007c]])
		vim.cmd([[ hi HopNextKey2 cterm=bold ctermfg=198 gui=bold guifg=#ff007c]])
		map("n", "f", "<cmd>HopChar1CurrentLineAC<cr>", { noremap = true })
		map("n", "t", "<cmd>lua require'hop'.hint_char2()<cr>", { noremap = true })
		map("v", "f", "<cmd>HopChar1CurrentLineAC<cr>", { noremap = true })
		map("v", "t", "<cmd>lua require'hop'.hint_char2()<cr>", { noremap = true })

		-- move current line up and down
		map("n", "<C-k>", ":m .-2<CR>==", { desc = "Switch line up" })
		map("n", "<C-j>", ":m .+1<CR>==", { desc = "Switch line down" })
		map("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { desc = "Switch line up" })
		map("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { desc = "Switch line down" })
		map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Switch line up" })
		map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Switch line down" })

		-- map("x", "<C-k>", "<Cmd>call utils#SwitchLine(line('.'), 'up')<CR>", { desc = "Switch line up" })
		-- map("x", "<C-j>", "<Cmd>call utils#SwitchLine(line('.'), 'down')<CR>", { desc = "Switch line down" })

		-- tmux navigation
		map("n", "<A-h>", function()
			require("tmux").move_left()
		end, { desc = "Tmux navigate left" })
		map("n", "<A-l>", function()
			require("tmux").move_right()
		end, { desc = "Tmux navigate right" })
		map("n", "<A-j>", function()
			require("tmux").move_bottom()
		end, { desc = "Tmux navigate buttom" })
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
		end, { desc = "Tmux resize buttom" })
		map("n", "<A-K>", function()
			require("tmux").resize_top()
		end, { desc = "Tmux resize up" })

		-- swap `;` with `:`
		map("n", ";", ":", { desc = "Swap `;` with `:`" })
		map("n", ":", ";", { desc = "Swap `;` with `:`" })
		map("v", ";", ":", { desc = "Swap `;` with `:`" })
		map("v", ":", ";", { desc = "Swap `;` with `:`" })

		-- [deprecated in favour of tmux integration] resize with arrows
		-- map("n", "<Up>", function()
		-- 	require("smart-splits").resize_up(2)
		-- end, { desc = "Resize split up" })
		-- map("n", "<Down>", function()
		-- 	require("smart-splits").resize_down(2)
		-- end, { desc = "Resize split down" })
		-- map("n", "<Left>", function()
		-- 	require("smart-splits").resize_left(2)
		-- end, { desc = "Resize split left" })
		-- map("n", "<Right>", function()
		-- 	require("smart-splits").resize_right(2)
		-- end, { desc = "Resize split right" })

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
		map("t", "<leader><esc>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
		map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quite" })
		-- map("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window" })
		-- map("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal below window" })
		-- map("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal above window" })
		-- map("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window" })
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
