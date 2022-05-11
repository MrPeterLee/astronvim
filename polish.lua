return function()
	local set = vim.opt
	local g = vim.g

	-- Options
	-- enable spelling check
	set.spell = false
	set.spelllang = { "en_us" }
	--  After adding a word to 'spellfile' with the above commands its associated
	--  '.spl' file will automatically be updated and reloaded. If you change
	--  'spellfile' manually you need to use the |:mkspell| command. This sequence of
	--  commands mostly works well:
	--
	--      :edit <spellfile; e.g. en.utf-8.add>
	--      (make changes to the spell file)
	--      :mkspell! %

	-- show whitespace characters
	set.list = true
	set.listchars = {
		tab = "│→",
		extends = "⟩",
		precedes = "⟨",
		trail = "·",
		nbsp = "␣",
	}
	set.showbreak = "↪ "
	-- enable conceal
	set.conceallevel = 2
	-- soft wrap lines
	set.wrap = true
	-- linebreak soft wrap at words
	set.linebreak = true

	-- set spell and thesaurus files
	-- set.spellfile = "~/.config/nvim/spell/en.utf-8.add"
	-- set.thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt"
	-- set Treesitter based folding and disable auto-folding on open
	set.foldenable = false
	set.foldmethod = "expr"
	set.foldexpr = "nvim_treesitter#foldexpr()"

	g.load_black = false
	g.loaded_matchit = true

	-- copilot
	g.copilot_no_tab_map = true
	g.copilot_assume_mapped = true
	g.copilot_tab_fallback = ""
	vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

	-- toggle term on the side
	local Terminal = require("toggleterm.terminal").Terminal
	local side_term = Terminal:new({
		-- cmd = "lazygit",
		-- dir = "git_dir",
		direction = "vertical",
		-- float_opts = {
		-- border = "double",
		-- },
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
		on_close = function(term)
			vim.cmd('echo "Closing terminal"')
		end,
	})
	function _side_term_toggle()
		side_term:toggle()
	end
	vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _side_term_toggle()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<A-.>", "<cmd>lua _side_term_toggle()<CR>", { noremap = true, silent = true })

	-- indent blankline
	vim.g.indent_blankline_filetype_exclude = {
		"lspinfo",
		"packer",
		"checkhealth",
		"help",
		"man",
		"markdown",
		"vimwiki",
	}

	-- Auto Commands
	require("user.autocmds").setup()

	-- Mappings
	require("user.mappings").setup()

	-- Filetypes
	require("user.filetype").setup()

	-- Load vimscript
	vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/utils.vim")
	vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/autocmd.vim")
	vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/init_last.vim")
end
