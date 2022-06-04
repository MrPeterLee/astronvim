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


local null_ls = require "null-ls"
return {
	-- Formatting and linting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	--
	-- Check supported formatters
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

	-- Check supported linters
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

		sources = {

			null_ls.builtins.code_actions.gitsigns,
			null_ls.builtins.code_actions.shellcheck,

			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.prettier.with { extra_filetypes = { "rmd" } },
			null_ls.builtins.formatting.isort,
			null_ls.builtins.formatting.shfmt,

			null_ls.builtins.diagnostics.shellcheck,
			-- builtins.diagnostics.codespell,

			-- Spell completion for text files
			null_ls.builtins.completion.spell.with({
				Filetypes = { "markdown", "text" },
			}),

			-- Spell diagnostic for text files
			-- null_ls.builtins.diagnostics.cspell,

			-- zsh - only highlights "parsing error" as a msg
			-- null_ls.builtins.diagnostics.zsh,

			-- makefile
			-- null_ls.builtins.diagnostics.checkmate,
			-- github workflow
			-- null_ls.builtins.diagnostics.actionlint,
		},

		-- You can remove this on attach function to disable format on save
on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}


		-- on_attach = function(client)
		-- 	if client.resolved_capabilities.document_formatting then
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			desc = "Auto format before save",
		-- 			pattern = "<buffer>",
		-- 			callback = vim.lsp.buf.formatting,
		-- 		})
		-- 	end
		-- end,
