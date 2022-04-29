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
	end,
}
