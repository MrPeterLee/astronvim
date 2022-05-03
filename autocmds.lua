return {
	setup = function()
		local map = vim.keymap.set
		local cmd = vim.api.nvim_create_autocmd
		local augroup = vim.api.nvim_create_augroup
		local del_augroup = vim.api.nvim_del_augroup_by_name

		del_augroup("TermMappings")

		augroup("dapui", {})
		cmd("FileType", {
			desc = "Make q close dap floating windows",
			group = "dapui",
			pattern = "dap-float",
			callback = function()
				map("n", "q", "<cmd>close!<cr>")
			end,
		})

		-- ToggleTerm
		function _G.set_terminal_keymaps()
			vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
			vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-h>",
				[[<C-\><C-n><C-W>h]],
				{ desc = "Terminal left window navigation" }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-j>",
				[[<C-\><C-n><C-W>j]],
				{ desc = "Terminal down window navigation" }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-k>",
				[[<C-\><C-n><C-W>k]],
				{ desc = "Terminal up window navigation" }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-l>",
				[[<C-\><C-n><C-W>l]],
				{ desc = "Terminal right window naviation" }
			)
		end

		augroup("TermMappings", {})
		cmd("TermOpen", {
			desc = "Set terminal keymaps",
			group = "TermMappings",
			callback = _G.set_terminal_keymaps,
		})
	end,
}
