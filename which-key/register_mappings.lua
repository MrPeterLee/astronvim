local utils = require("user.utils")
local alt_file = require("user.plugins.alternate-file")

return {
	n = {
		["<leader>"] = {

			["<cr>"] = { "<Plug>VimwikiDiaryIndex", "Trading Journal" },
			["<tab>"] = { "<Plug>VimwikiIndex", "Notebook" },
			["<space>"] = { "<cmd>Telescope buffers<CR>", "Buffer List" },
			["c"] = { "<cmd>Bdelete!<CR>", "Bye Buffer" },
			["C"] = { "<cmd>bdelete!<cr>", "Close Buffer" },
			["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
			["h"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
			["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
			-- ["r"] = { "<cmd>SendHere<cr>", "Set REPL" },
			["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },

			["w"] = { "<cmd> silent write || normal zz <cr>", "Save" },

			e = { "<cmd>cd %:p:h || Neotree toggle<cr>", "File Explorer" },
			g = {
				g = { '<cmd>:cd %:p:h || lua require("core.utils").toggle_term_cmd "lazygit"<cr>', "LazyGit" },
			},

			r = { "<cmd>silent write || call jupyter_ascending#execute()<cr>", "Run Line" },
			R = { "<cmd>silent write || call jupyter_ascending#execute_all()<cr>", "Run All" },

			-- Alternate file
			a = {
				function()
					alt_file.main(vim.fn.expand("%:p"))
				end,
				"Alt File",
			},

			-- Coding Actions
			k = {
				l = {
					function()
						local filename = vim.fn.expand("%:t")

						utils.async_run({
							"ts",
							"research",
							"start",
							"--port",
							"8888",
							"--detach",
							"--project",
							vim.fn.expand("%:p:h"),
						}, function()
							utils.quick_notification(
								"Lean research session online: http://localhost:8888/notebooks/" .. filename .. ".ipynb"
							)
						end)
					end,
					"Lean Research",
				},
				s = {
					function()
						utils.async_run({
							"ts",
							"jupyter",
							"stop",
							"--port",
							"8888",
						}, function() end)
						utils.async_run({
							"ts",
							"research",
							"stop",
							"--port",
							"8888",
						}, function()
							utils.quick_notification("Terminated jupyter session(s) on port 8888")
						end)
					end,
					"Lean Research (Stop)",
				},
				k = {
					function()
						local folder = vim.fn.expand("%:p:h")
						print("Running backtest on project: " .. folder)
						vim.cmd("silent! write")
						utils.async_run({
							"ts",
							"backtest",
							"--port",
							"60002",
							"--detach",
							"--file",
							vim.fn.expand("%:p"),
						}, function()
							local backtest_folder = vim.fn.getqflist()[2]["text"]
							utils.quick_notification("Backtest completed for: " .. backtest_folder)
							vim.cmd(
								"call timer_start(8000, { tid -> execute('e "
									.. backtest_folder
									.. "/log.txt"
									.. " || normal G')})"
							)
						end)
					end,
					"Kick-off Backtest",
				},
				j = {
					function()
						local filename = vim.fn.expand("%:t")
						utils.async_run(
							{ "ts", "jupyter", "start", "--port", "8888", "--detach", "--file", vim.fn.expand("%:p") },
							function()
								utils.quick_notification(
									"Jupyter session online: http://localhost:8888/notebooks/" .. filename .. ".ipynb"
								)
							end
						)
					end,
					"Jupyter",
				},
				r = { vim.lsp.buf.rename, "Rename" },
				c = { "<cmd>Copilot<cr>", "Copilot" },
				p = { "<cmd>Copilot panel<cr>", "Copilot Panel" },
				U = { "<cmd>Copilot status<cr>", "Copilot Status" },
				f = {
					"<cmd>silent write | silent !black % | autoflake -i % --expand-star-imports --remove-all-unused-imports --ignore-init-module-imports --remove-duplicate-keys --remove-unused-variables <cr>",
					"Format .py",
				},
				F = { vim.lsp.buf.formatting_sync, "LSP Format" },
				H = {
					"<cmd>:0 | let blank=''|let t='\"\"\" {Module Name}'|put=t|put=blank|let t='id:            Peter Lee (peter.lee@finclab.com)'|put=t|let t='last_update:   ' . strftime('%Y-%m-%d %H:%M:%S %Z')|put=t|let t='type:          lib'|put=t|let t='sensitivity:   datalab@finclab.com'|put=t|let t='platform:      any'|put=t|let t='description:   {Description}'|put=t|let t='\"\"\"'|put=t<CR>",
					"Add .py Header",
				},
				d = {
					name = "DocString",
					["<cr>"] = {
						function()
							require("neogen").generate()
						end,
						"Current",
					},
					c = {
						function()
							require("neogen").generate({ type = "class" })
						end,
						"Class",
					},
					f = {
						function()
							require("neogen").generate({ type = "func" })
						end,
						"Function",
					},
					t = {
						function()
							require("neogen").generate({ type = "type" })
						end,
						"Type",
					},
					F = {
						function()
							require("neogen").generate({ type = "file" })
						end,
						"File",
					},
				},
			},

			-- Coding Navigation
			l = {
				t = { "<cmd>TroubleToggle<cr>", "Trouble" },
				w = { "<cmd>Trouble workspce_diagnostics<cr>", "Workspace Diagnostic" },
				l = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostic" },
				q = { "<cmd>Trouble quickfix<cr>", "Trouble Quickfix" },
			},

			t = {
				-- toggle glances in terminal
				p = { '<cmd>lua require("core.utils").toggle_term_cmd("ipython")<cr>', "iPython" },
				-- toggle ipython in terminal
				g = {
					'<cmd>lua require("core.utils").toggle_term_cmd("export TERM=xterm && glances")<cr>',
					"glances",
				},
				t = { "<cmd>ToggleTerm dir='git_dir' direction='tab'<CR>", "Term in New Tab" },
				H = { '<cmd>lua require("core.utils").toggle_term_cmd("sudo htop")<cr>', "Htop" },
			},

			f = {
				name = "Find",
				["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
				c = { "<cmd>Telescope commands<cr>", "Commands" },
				f = { "<cmd>Telescope find_files<cr>", "Files" },
				F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
				h = { "<cmd>Telescope oldfiles<cr>", "History" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				M = { "<cmd>Telescope media_files<cr>", "Media" },
				n = { "<cmd>Telescope notify<cr>", "Notifications" },
				p = { "<cmd>Telescope project<cr>", "Projects" },
				r = { "<cmd>Telescope registers<cr>", "Registers" },
				t = { "<cmd>TodoTelescope<cr>", "To-do List" },
				T = { "<cmd>Telescope colorscheme<cr>", "Themes" },
				w = { "<cmd>Telescope live_grep<cr>", "Words" },
				y = { "<cmd>Telescope neoclip<cr>", "Yank History" },
				o = { nil },
				-- to-do comments
			},

			m = {
				name = "Compiler",
				k = { "<cmd>w<cr><cmd>AsyncRun compiler %:p<cr><cr>", "Compile" },
				a = { "<cmd>AsyncRun autocomp %:p<cr><cr>", "Auto Compile" },
				v = { "<cmd>!opout %:p<cr><cr>", "View Output" },
				b = {
					"<cmd>w<cr><cmd>AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -t beamer -o %:r.pdf<cr><cr>",
					"Compile Beamer",
				},
				p = { "<cmd>![[ -e %:r.pdf ]] && pdfpc %:r.pdf<cr><cr>", "Present Output" },
				l = { "<cmd>call asyncrun#quickfix_toggle(8)<cr>", "Logs" },
				t = { "<cmd>TexlabBuild<cr>", "LaTeX" },
				f = { "<cmd>TexlabForward<cr>", "Forward Search" },
			},

			d = {
				name = "Document",
				s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
				t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
				p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
				b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
				c = {
					function()
						utils.vim_opt_toggle("conceallevel", 2, 0, "Conceal")
					end,
					"Toggle Conceal",
				},
				w = {
					function()
						utils.vim_opt_toggle("wrap", true, false, "Soft Wrap")
					end,
					"Toggle Soft Wrapping",
				},
				W = {
					function()
						utils.vim_opt_toggle("textwidth", 80, 0, "Hard Wrap")
					end,
					"Toggle Hard Wrapping",
				},
				m = { "<cmd>Glow<cr>", "Preview Markdown" },
				f = { '<cmd>call feedkeys("mxgggqG\'x", "n")<cr>', "Format Markdown" },
				e = {
					function()
						require("nabla").popup()
					end,
					"Preview Equation",
				},
			},

			-- vim.api.nvim_feedkeys(copilot_keys, "i", true)
			s = {
				name = "Switch Board",
				["<cr>"] = { "<cmd>BufferLineTogglePin<cr>", "Set Buffer Pin" },
				["w"] = { "<cmd>lua require('nvim-window').pick()<CR>", "Switch Window" },
				["s"] = { "<cmd>BufferLineTogglePin<cr>", "Set Buffer Pin" },
				["n"] = { '<cmd>vsplit | lua vim.api.nvim_feedkeys("<c-w>ge", "n", true)<cr>', "New GUI Window" },
				["l"] = { "<cmd>BufferLineCloseRight<cr>", "Close Buffers (Right)" },
				["h"] = { "<cmd>BufferLineCloseLeft<cr>", "Close Buffers (Left)" },
				["p"] = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
				["x"] = { "<cmd>BufferLinePickClose<cr>", "Pick Close Buffer" },
				["t"] = { "<cmd>BufferLineSortByTabs<cr>", "Buffers sort by tabs" },
				["d"] = { "<cmd>BufferLineSortByDirectory<cr>", "Buffers sort by dir" },
				["e"] = { "<cmd>BufferLineSortByExtension<cr>", "Buffers sort by ext" },
				b = { nil },
				c = { nil },
				k = { nil },
				m = { nil },
				r = { nil },
			},

			n = {
				name = "Notes",
				["<cr>"] = { "<Plug>VimwikiMakeDiaryNote", "Diary (Today)" },
				n = { "<Plug>VimwikiMakeDiaryNote", "Diary (Today)" },
				y = { "<Plug>VimwikiMakeYesterdayDiaryNote", "Diary (Yesterday)" },
				e = { "<Plug>VimwikiTOC", "Table of Contents" },
				c = { "<Plug>VimwikiColorize", "Colorize" },
				r = { "<Plug>VimwikiRenameFile", "Rename File" },
				d = { "<Plug>VimwikiDeleteFile", "Delete File" },
				w = { "<Plug>VimwikiMakeTomorrowDiaryNote", "Diary (Tomorrow)" },
				i = { "<Plug>VimwikiDiaryIndex", "All Journal" },
				x = { "<Plug>VimwikiRemoveDone", "Remove [x]" },
				t = { "<Plug>VimwikiNextTask", "Next checkbox" },
				s = { "<CMD>call GetSyntax()<CR>", "Show highlight group" },
				p = { "<CMD>MarkdownPreviewToggle<CR>", "Markdown Preview Toggle" },
				P = { "<CMD>MarkdownPreviewStop<CR>", "Stop Markdown Preview" },
			},

			x = {
				name = "Debugger",
				b = {
					function()
						require("dap").toggle_breakpoint()
					end,
					"Toggle Breakpoint",
				},
				B = {
					function()
						require("dap").clear_breakpoints()
					end,
					"Clear Breakpoints",
				},
				c = {
					function()
						require("dap").continue()
					end,
					"Continue",
				},
				i = {
					function()
						require("dap").step_into()
					end,
					"Step Into",
				},
				l = {
					function()
						require("dapui").float_element("breakpoints")
					end,
					"List Breakpoints",
				},
				o = {
					function()
						require("dap").step_over()
					end,
					"Step Over",
				},
				q = {
					function()
						require("dap").close()
					end,
					"Close Session",
				},
				Q = {
					function()
						require("dap").terminate()
					end,
					"Terminate",
				},
				r = {
					function()
						require("dap").repl.toggle()
					end,
					"REPL",
				},
				s = {
					function()
						require("dapui").float_element("scopes")
					end,
					"Scopes",
				},
				t = {
					function()
						require("dapui").float_element("stacks")
					end,
					"Threads",
				},
				u = {
					function()
						require("dapui").toggle()
					end,
					"Toggle Debugger UI",
				},
				w = {
					function()
						require("dapui").float_element("watches")
					end,
					"Watches",
				},
				x = {
					function()
						require("dap.ui.widgets").hover()
					end,
					"Inspect",
				},
			},
		},
		["]"] = {
			f = "Next function start",
			x = "Next class start",
			F = "Next function end",
			X = "Next class end",
		},
		["["] = {
			f = "Previous function start",
			x = "Previous class start",
			F = "Previous function end",
			X = "Previous class end",
		},
		g = {
			t = {
				name = "Treesitter",
				v = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "variable_declaration" })
					end,
					"Go to Variables",
				},
				f = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "function" })
					end,
					"Go to Functions",
				},
				i = {
					function()
						require("syntax-tree-surfer").targeted_jump({
							"if_statement",
							"else_clause",
							"else_statement",
							"elseif_statement",
						})
					end,
					"Go to If Statements",
				},
				r = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "for_statement" })
					end,
					"Go to If Statements",
				},
				w = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "white_statement" })
					end,
					"Go to While Statements",
				},
				s = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "switch_statement" })
					end,
					"Go to Switch Statements",
				},
				t = {
					function()
						require("syntax-tree-surfer").targeted_jump({
							"function",
							"if_statement",
							"else_clause",
							"else_statement",
							"elseif_statement",
							"for_statement",
							"while_statement",
							"switch_statement",
						})
					end,
					"Go to Statement",
				},
			},
		},
	},
	i = {
		["<c-d>"] = {
			n = { "<c-r>.strftime('%Y-%m-%d')<cr>", "Y-m-d" },
			x = { "<c-r>.strftime('%m/%d/%y')<cr>", "m/d/y" },
			f = { "<c-r>.strftime('%B %d, %Y')<cr>", "B d, Y" },
			X = { "<c-r>.strftime('%H:%M')<cr>", "H:M" },
			F = { "<c-r>.strftime('%H:%M:%S')<cr>", "H:M:S" },
			d = { "<c-r>.strftime('%Y/%m/%d %H:%M:%S')<cr>", "Y/m/d H:M:S" },
		},
	},
	v = {
		["<leader>"] = {

			["/"] = { "Comment" },
			["<cr>"] = { "<Plug>VimwikiDiaryIndex", "Trading Journal" },
			["<tab>"] = { "<Plug>VimwikiIndex", "Notebook" },
			["<space>"] = { "<cmd>Telescope buffers<CR>", "Buffer List" },
			[","] = { "<Plug>VimwikiToggleListItem", "Toggle Todo" },

			-- Github Copilot
			l = { c = { "<cmd>Copilot<cr>", "Github Copilot" } },

			n = {
				name = "Notes",
				["<cr>"] = { ":VimwikiIndex<cr>", "Notes Index" },
				n = { ":VimwikiMakeDiaryNote<cr>", "Diary (Today)" },
				y = { ":VimwikiMakeYesterdayDiaryNote<cr>", "Diary (Yesterday)" },
				t = { ":VimwikiMakeTomorrowDiaryNote<cr>", "Diary (Tomorrow)" },
			},

			x = {
				name = "Debugger",
				e = {
					function()
						require("dapui").eval()
					end,
					"Evaluate Line",
				},
			},
			h = {
				name = "Hop",
				c = { "<cmd>HopChar1<cr>", "Character" },
				C = { "<cmd>HopChar2<cr>", "2 Characters" },
				l = { "<cmd>HopLine<cr>", "Line" },
				p = { "<cmd>HopPattern<cr>", "Pattern" },
				w = { "<cmd>HopWord<cr>", "Word" },
			},
		},
	},
}
