-- Info: https://astronvim.github.io/configuration/splitting_up
-- The plugins plugins.init override table (or function(table)...end) can be placed in the file user/plugins/init.lua
-- which would be a lua file that returns the override table or function(table)...end.

return function(plugins)
	local my_plugins = {
		{
			"aserowy/tmux.nvim",
			config = function()
				require("user.plugins.tmux")()
			end,
		},
		{
			"EdenEast/nightfox.nvim",
			config = function()
				require("nightfox").setup(require("user.plugins.nightfox"))
			end,
		},
		{ "andymass/vim-matchup", event = { "BufRead", "BufNewFile" } },
		{
			"danymat/neogen",
			module = "neogen",
			cmd = "Neogen",
			config = function()
				require("neogen").setup(require("user.plugins.neogen"))
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		},
		{
			"dhruvasagar/vim-table-mode",
			cmd = { "TableModeToggle", "TableModeEnable", "TableModeDisable" },
			setup = function()
				vim.g.table_mode_corner = "|"
			end,
		},
		-- 		{
		-- 			"echasnovski/mini.nvim",
		-- 			config = function()
		-- 				require("user.plugins.mini")()
		-- 			end,
		-- 		},
		{
			"ellisonleao/glow.nvim",
			cmd = "Glow",
			module = "glow",
			setup = function()
				vim.g.glow_border = "rounded"
			end,
		},
		{
			"ethanholz/nvim-lastplace",
			event = "BufRead",
			config = function()
				require("nvim-lastplace").setup(require("user.plugins.nvim-lastplace"))
			end,
		},
		{
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			module = "zen-mode",
			config = function()
				require("zen-mode").setup(require("user.plugins.zen-mode"))
			end,
		},
		{
			"hrsh7th/cmp-calc",
			after = "nvim-cmp",
			config = function()
				require("core.utils").add_user_cmp_source("calc")
			end,
		},
		{
			"hrsh7th/cmp-emoji",
			after = "nvim-cmp",
			config = function()
				require("core.utils").add_user_cmp_source("emoji")
			end,
		},
		{ "jbyuki/nabla.nvim", module = "nabla" },
		{
			"jc-doyle/cmp-pandoc-references",
			after = "nvim-cmp",
			config = function()
				require("core.utils").add_user_cmp_source("pandoc_references")
			end,
		},
		{
			"kdheepak/cmp-latex-symbols",
			after = "nvim-cmp",
			config = function()
				require("core.utils").add_user_cmp_source("latex_symbols")
			end,
		},
		{
			"mfussenegger/nvim-dap",
			module = "dap",
			config = require("user.plugins.dap"),
		},
		{
			"mickael-menu/zk-nvim",
			module = { "zk", "zk.commands" },
			config = function()
				require("zk").setup(require("user.plugins.zk"))
			end,
		},
		{
			"mtikekar/nvim-send-to-term",
			cmd = "SendHere",
			setup = function()
				vim.g.send_disable_mapping = true
			end,
		},
		{ "nanotee/sqls.nvim", after = "nvim-lspconfig" },
		{
			"phaazon/hop.nvim",
			event = { "BufRead", "BufNewFile" },
			branch = "v1",
			config = function()
				require("hop").setup({
					case_insensitive = true,
					char2_fallback_key = "<CR>",
					quit_key = "<Esc>",
				})
			end,
		},
		{
			"rcarriga/nvim-dap-ui",
			after = "nvim-dap",
			config = function()
				local dap, dapui = require("dap"), require("dapui")
				dapui.setup(require("user.plugins.dapui"))
				-- add listeners to auto open DAP UI
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end,
		},
		{ "skywind3000/asyncrun.vim", cmd = "AsyncRun" },
		{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
		{
			"nvim-telescope/telescope-bibtex.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("bibtex")
			end,
		},
		{
			"nvim-telescope/telescope-hop.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("hop")
			end,
		},
		{
			"nvim-telescope/telescope-media-files.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("media_files")
			end,
		},
		{
			"nvim-telescope/telescope-project.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("project")
			end,
		},
		{
			"vitalk/vim-simple-todo",
			keys = {
				"<Plug>(simple-todo-above)",
				"<Plug>(simple-todo-below)",
				"<Plug>(simple-todo-mark-as-done)",
				"<Plug>(simple-todo-mark-as-undone)",
				"<Plug>(simple-todo-mark-switch)",
				"<Plug>(simple-todo-new-list-item)",
				"<Plug>(simple-todo-new-list-item-start-of-line)",
			},
			setup = function()
				vim.g.simple_todo_map_keys = false
			end,
		},

		-- display function context on top of the screen
		-- good plugin, but prompts a deprecation warning; disabled temporarily
		-- {
		-- 	"romgrk/nvim-treesitter-context",
		-- 	config = function()
		-- 		vim.defer_fn(function()
		-- 			require("treesitter-context.config").setup({ enable = true })
		-- 		end, 2000)
		-- 	end,
		-- },

		-- Select python functions
		{ "mfussenegger/nvim-ts-hint-textobject" },

		{ "wakatime/vim-wakatime", event = "BufRead" },

		-- GitHub copilot
		{
			"github/copilot.vim",
		},

		-- Highlight to-do syntax
		{
			"folke/todo-comments.nvim",
			event = "BufRead",
			config = function()
				vim.defer_fn(function()
					require("todo-comments").setup()
				end, 2000)
			end,
		},

		-- Harpoon: Maintain a list of hot-files for jumping
		{
			"ThePrimeagen/harpoon",
			config = function()
				vim.defer_fn(function()
					require("user.plugins.harpoon").setup()
				end, 2000)
			end,
		},

		-- navigate between old and new git commits for the current line and view the diffs easily.
		-- use { "rhysd/git-messenger.vim" }

		-- To speed up start-up time by 10ms
		{ "nathom/filetype.nvim" },

		-- makes default vim ui prompts nicer
		{
			"stevearc/dressing.nvim",
			config = function()
				vim.defer_fn(function()
					require("dressing").setup({
						-- Can be 'left', 'right', or 'center'
						prompt_align = "left",
					})
				end, 2000)
			end,
		},

		-- hit ctrl-p to yield a palette similar to vsc command search
		{
			"mrjones2014/legendary.nvim",
			keys = { [[<C-p>]] },
			config = function()
				require("user.plugins.legendary").setup()
			end,
			requires = { "stevearc/dressing.nvim" },
		},
	}

	-- Disabled Default Plugins
	plugins["glepnir/dashboard-nvim"] = nil
	-- plugins["max397574/better-escape.nvim"] = nil
	plugins["karb94/neoscroll.nvim"] = nil
	-- plugins["lukas-reineke/indent-blankline.nvim"] = nil
	-- plugins["numToStr/Comment.nvim"] = nil

	-- Disabled Default Lazy Loading
	plugins["nvim-neo-tree/neo-tree.nvim"].cmd = nil
	plugins["nvim-neo-tree/neo-tree.nvim"].module = nil

	return vim.tbl_deep_extend("force", plugins, my_plugins)
end
