-- null-ls configuration

return function()
	local status_ok, null_ls = pcall(require, "null-ls")

	if not status_ok then
		return
	end

	-- Formatting and linting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	--
	-- Check supported formatters
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

	-- Check supported linters
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

	local builtins = null_ls.builtins

	null_ls.setup({
		debug = false,
		sources = {
			builtins.code_actions.gitsigns,
			builtins.code_actions.shellcheck,
			builtins.formatting.stylua,
			builtins.formatting.black,
			builtins.formatting.isort,
			builtins.formatting.prettier.with({
				extra_filetypes = { "rmd", "md", "markdown" },
			}),

			builtins.formatting.shfmt,
			builtins.diagnostics.shellcheck,
			builtins.diagnostics.codespell.with({
				Filetypes = { "python", "javascript" },
			}),

			-- Spell completion for text files
			builtins.completion.spell.with({
				Filetypes = { "markdown", "text" },
			}),
			-- Spell diagnostic for text files
			-- builtins.diagnostics.cspell,

			-- zsh - only highlights "parsing error" as a msg
			-- builtins.diagnostics.zsh,

			-- makefile
			-- builtins.diagnostics.checkmate,
			-- github workflow
			-- builtins.diagnostics.actionlint,
		},

		-- You can remove this on attach function to disable format on save
		-- on_attach = function(client)
		-- 	if client.resolved_capabilities.document_formatting then
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			desc = "Auto format before save",
		-- 			pattern = "<buffer>",
		-- 			callback = vim.lsp.buf.format,
		-- 		})
		-- 	end
		-- end,
	})
end
