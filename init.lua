-- Scripts must be loaded before plugins are loaded
vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/init_first.vim")


-- require'lspconfig'.pyright.setup{}
local config = {

	-- colorscheme = "duskfox",


	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Add paths for including more VS Code style snippets in luasnip
	luasnip = {
		vscode_snippet_paths = {},
	},

	-- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    	-- if client.name == "python" then
        -- require("pyright").on_attach(client, bufnr)
      -- end
    -- end,





    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server.name].setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    -- ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    -- },
  },

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	-- options = {
	-- opt = {
	-- 	relativenumber = true, -- sets vim.opt.relativenumber
	-- },
	-- g = {
	-- 	mapleader = " ", -- sets vim.g.mapleader
	-- },
	-- },

	-- Diagnostics configuration (for vim.diagnostics.config())
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- Set dashboard header
	header = {
		" ",
		" ",
		" ",
		" ",
		" ",
		"       ██╗  ██╗███████╗██╗  ░██╗  ██████╗░███████╗████████╗███████╗██████╗ ",
		"       ██║ ░██║██╔════╝╚██╗░██╔╝  ██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗",
		"       ███████║█████╗░░░╚████╔╝░  ██████╔╝█████╗░░░  ██║░░░█████╗░░██████╔╝",
		"       ██╔══██║██╔══╝░░░░╚██╔╝░░  ██╔═══╝░██╔══╝░░░  ██║░░░██╔══╝░░██╔══██╗",
		"       ██║░░██║███████╗░░░██║░░░  ██║░░░░░███████╗░░░██║░░░███████╗██║░░██║",
		"       ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░  ╚═╝░░░░░╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝",
		" ",
		"          ██████╗ ███████╗████████╗  ███╗   ███╗ █████╗ ██████╗░███████╗  ",
		"         ██╔════╝░██╔════╝╚══██╔══╝  ████╗░████║██╔══██╗██╔══██╗██╔════╝  ",
		"         ██║░░██╗░█████╗░░░  ██║░░░  ██╔████╔██║██║░░██║██████╔╝█████╗░░  ",
		"         ██║░░╚██╗██╔══╝░░░  ██║░░░  ██║╚██╔╝██║██║░░██║██╔══██╗██╔══╝░░  ",
		"         ╚██████╔╝███████╗░░░██║░░░  ██║░╚═╝░██║╚█████╔╝██║░░██║███████╗  ",
		"         ░╚═════╝░╚══════╝░░░╚═╝░░░  ╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝  ",
		" ",
		"  ██╗       ██╗ █████╗ ██████╗░██╗  ██╗  ██████╗  █████╗ ███╗  ██╗███████╗  ██╗",
		"  ██║ ░██╗ ░██║██╔══██╗██╔══██╗██║░██╔╝  ██╔══██╗██╔══██╗████╗░██║██╔════╝  ██║",
		"  ╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░  ██║░░██║██║░░██║██╔██╗██║█████╗░░  ██║",
		"   ████╔═████║░██║░░██║██╔══██╗██╔═██╗░  ██║░░██║██║░░██║██║╚████║██╔══╝░░  ╚═╝",
		"   ╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗  ██████╔╝╚█████╔╝██║░╚███║███████╗  ██╗",
		"    ╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚══╝╚══════╝  ╚═╝",
		" ",
		" ",
		" ",
	},
}

return config
