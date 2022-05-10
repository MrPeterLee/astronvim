local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local function vim_opt_toggle(opt, on, off, name)
	return function()
		local message = name
		if vim.opt[opt]._value == off then
			vim.opt[opt] = on
			message = message .. " Enabled"
		else
			vim.opt[opt] = off
			message = message .. " Disabled"
		end
		vim.notify(message, "info", require("core.utils").base_notification)
	end
end

local function opts(mode, prefix)
	return {
		mode = mode,
		prefix = prefix,
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
end

-- Normal Mode <leader> Mappings
local Nmappings = {
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

	l = {
		-- Github Copilot
		c = { "<cmd>Copilot<cr>", "Copilot" },
		p = { "<cmd>Copilot panel<cr>", "Copilot Panel" },
		U = { "<cmd>Copilot status<cr>", "Copilot Status" },

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

	t = {
		-- toggle glances in terminal
		p = { '<cmd>lua require("core.utils").toggle_term_cmd("ipython")<cr>', "iPython" },
		-- toggle ipython in terminal
		g = { '<cmd>lua require("core.utils").toggle_term_cmd("export TERM=xterm && glances")<cr>', "glances" },
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
		c = { vim_opt_toggle("conceallevel", 2, 0, "Conceal"), "Toggle Conceal" },
		w = { vim_opt_toggle("wrap", true, false, "Soft Wrap"), "Toggle Soft Wrapping" },
		W = { vim_opt_toggle("textwidth", 80, 0, "Hard Wrap"), "Toggle Hard Wrapping" },
		m = { "<cmd>Glow<cr>", "Preview Markdown" },
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
}

local Dmappings = {
	n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
	x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
	f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
	X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
	F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
	d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
}

local Vmappings = {
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
}

local Gmappings = {
	d = { "Go to definition" },
	D = { "Go to declaration" },
	I = { "Go to implementation" },
	r = { "Go to references" },
	o = { "Open diagnostic" },
}

local NextBracketmappings = {
	d = { "Next diagnostic" },
	f = "Next function start",
	x = "Next class start",
	F = "Next function end",
	X = "Next class end",
}

local PrevBracketmappings = {
	d = { "Previous diagnostic" },
	f = { "Previous function start" },
	x = { "Previous class start" },
	F = { "Previous function end" },
	X = { "Previous class end" },
}

which_key.register(Gmappings, opts("n", "g"))
which_key.register(Vmappings, opts("v", "<leader>"))
which_key.register(Dmappings, opts("i", "<c-d>"))
which_key.register(NextBracketmappings, opts("n", "]"))
which_key.register(PrevBracketmappings, opts("n", "["))

return Nmappings
