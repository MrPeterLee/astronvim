return function()
	local set = vim.opt
	local g = vim.g

	-- Options
	-- enable spelling check
	set.spell = true
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

	-- Auto Commands
	require("user.autocmds").setup()

	-- Mappings
	require("user.mappings").setup()

	-- Filetypes
	require("user.filetype").setup()

	-- Load vimscript
	vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/plugins.vim")
	vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/utils.vim")
	vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/autocmd.vim")
end
