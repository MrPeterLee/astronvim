-- Auto-formmating for NVIM 0.8
-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(clients)
--             -- filter out clients that you don't want to use
--             return vim.tbl_filter(function(client)
--                 return client.name ~= "tsserver"
--             end, clients)
--         end,
--         bufnr = bufnr,
--     })
-- end
--
-- -- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- add to your shared on_attach callback
-- local on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--                 lsp_formatting(bufnr)
--             end,
--         })
--     end
-- end

return function()
	local status_ok, null_ls = pcall(require, "null-ls")

	if not status_ok then
		print("NULL-LS status is not OK!!! Please check.")
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
			builtins.formatting.prettier,
			builtins.formatting.shfmt,

			builtins.diagnostics.shellcheck,
			builtins.diagnostics.codespell,

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
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.api.nvim_create_autocmd("BufWritePre", {
					desc = "Auto format before save",
					pattern = "<buffer>",
					callback = vim.lsp.buf.formatting,
				})
			end
		end,
	})
end
