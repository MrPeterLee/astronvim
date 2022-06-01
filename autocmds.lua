return {
	setup = function()
		local map = vim.keymap.set
		local cmd = vim.api.nvim_create_autocmd
		local augroup = vim.api.nvim_create_augroup
		local del_augroup = vim.api.nvim_del_augroup_by_name

		-- dapui
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
			vim.api.nvim_buf_set_keymap(0, "n", "<cr>", "i<cr>", { noremap = true })
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<C-t>",
				[[<C-\><C-n><Esc>:silent ToggleTerm<CR>]],
				{ desc = "Close Terminal", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<C-\\>",
				[[<C-\><C-n><Esc>:silent ToggleTerm<CR>]],
				{ desc = "Close Terminal", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<esc>",
				[[<C-\><C-n>]],
				{ desc = "Terminal normal mode", noremap = true }
			)
			-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
			-- Normal Mode
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-h>",
				[[<C-\><C-n><cmd>lua require("tmux").move_left()<cr>]],
				{ desc = "Tmux navigate left", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-l>",
				[[<C-\><C-n><cmd>lua require("tmux").move_right()<cr>]],
				{ desc = "Tmux navigate right", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-j>",
				[[<C-\><C-n><cmd>lua require("tmux").move_down()<cr>]],
				{ desc = "Tmux navigate bottom", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<A-k>",
				[[<C-\><C-n><cmd>lua require("tmux").move_up()<cr>]],
				{ desc = "Tmux navigate up", noremap = true }
			)

			-- Insert Mode
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<C-h>",
				[[<C-\><C-n><cmd>lua require("tmux").move_left()<cr>]],
				{ desc = "Terminal left window navigation", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<C-j>",
				[[<C-\><C-n><cmd>lua require("tmux").move_down()<cr>]],
				{ desc = "Terminal down window navigation", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<C-k>",
				[[<C-\><C-n><cmd>lua require("tmux").move_up()<cr>]],
				{ desc = "Terminal up window navigation", noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<C-l>",
				-- [[<C-\><C-n><C-W>l]],
				[[<C-\><C-n><cmd>lua require("tmux").move_right()<cr>]],
				{ desc = "Terminal right window naviation", noremap = true }
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
