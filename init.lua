-- Scripts must be loaded before plugins are loaded
vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/init_first.vim")

-- require'lspconfig'.pyright.setup{}
local config = {

	-- Set colorscheme
	colorscheme = "default_theme",

	-- Update settings
	updater = {
		channel = "stable",
		remote = "origin",
		version = "latest",
		branch = "main",
		commit = nil,
		pin_plugins = true,
		skip_prompts = true,
		show_changelog = true,
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assumes user/AstroNvim.git
		-- },
	},

	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Add paths for including more VS Code style snippets in luasnip
	luasnip = {
		vscode_snippet_paths = {},
	},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
		},
	},

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
