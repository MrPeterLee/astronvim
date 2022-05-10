-- Create a color palette from nightfox
local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

local meta = {
	name = "nightfox",
	light = false,
}

local palette = {
	black = Shade.new("#393b44", 0.15, -0.15),
	red = Shade.new("#c94f6d", 0.15, -0.15),
	green = Shade.new("#81b29a", 0.10, -0.15),
	yellow = Shade.new("#dbc074", 0.15, -0.15),
	blue = Shade.new("#719cd6", 0.15, -0.15),
	magenta = Shade.new("#9d79d6", 0.30, -0.15),
	cyan = Shade.new("#63cdcf", 0.15, -0.15),
	white = Shade.new("#dfdfe0", 0.15, -0.15),
	orange = Shade.new("#f4a261", 0.15, -0.15),
	pink = Shade.new("#d67ad2", 0.15, -0.15),

	comment = "#526176",

	bg0 = "#131a24", -- Dark bg (status line and float)
	bg1 = "#192330", -- Default bg
	bg2 = "#212e3f", -- Lighter bg (colorcolm folds)
	bg3 = "#29394e", -- Lighter bg (cursor line)
	bg4 = "#415166", -- Conceal, border fg

	fg0 = "#d6d6d7", -- Lighter fg
	fg1 = "#cdcecf", -- Default fg
	fg2 = "#aeafb0", -- Darker fg (status line)
	fg3 = "#71839b", -- Darker fg (line numbers, fold colums)

	sel0 = "#223249", -- Popup bg, visual selection bg
	sel1 = "#3a567d", -- Popup sel bg, search bg
}

-- Source lvim palette
local lvim = {
	bg_01 = "#242B30",
	bg_02 = "#272F35",
	bg_03 = "#2A3339",
	fg = "#819586",
	color_0 = "#56adb7",
	color_1 = "#158FA7",
	color_2 = "#90c1a3",
	color_3 = "#FF7A66",
	color_4 = "#1C9898",
	color_5 = "#A7C080",
	color_6 = "#628b97",
	color_7 = "#ff5c57",
	color_8 = "#E6C068",
	color_9 = "#F2AF5C",
	color_10 = "#F2994B",
	color_11 = "#43ACAB",
	color_12 = "#8fbcbb",
	color_13 = "#F05F4E",
	color_14 = "#458588",
	term_0 = "#2E3440",
	term_8 = "#FF7A66",
	term_1 = "#F05F4E",
	term_9 = "#F05F4E",
	term_2 = "#A7C080",
	term_10 = "#A7C080",
	term_3 = "#1F8C8C",
	term_11 = "#1F8C8C",
	term_4 = "#2AA198",
	term_12 = "#2AA198",
	term_5 = "#83a598",
	term_13 = "#83a598",
	term_6 = "#F2994B",
	term_14 = "#F2994B",
	term_7 = "#00839F",
	term_15 = "#00839F",
	color_error = "#F05F4E",
	color_warning = "#F2994B",
	color_success = "#A7C080",
	color_info = "#56adb7",
	color_add = "#90c1a3",
	color_delete = "#F05F4E",
	color_change = "#E6C068",
	color_change_delete = "#F2994B",
	hl_01 = "#46555A",
	hl_02 = "#3A464A",
	none = "NONE",
}

function lvim.terminal_color()
	vim.g.terminal_color_0 = lvim.term_0
	vim.g.terminal_color_1 = lvim.term_1
	vim.g.terminal_color_2 = lvim.term_2
	vim.g.terminal_color_3 = lvim.term_3
	vim.g.terminal_color_4 = lvim.term_4
	vim.g.terminal_color_5 = lvim.term_5
	vim.g.terminal_color_6 = lvim.term_6
	vim.g.terminal_color_7 = lvim.term_7
	vim.g.terminal_color_8 = lvim.term_8
	vim.g.terminal_color_9 = lvim.term_9
	vim.g.terminal_color_10 = lvim.term_10
	vim.g.terminal_color_11 = lvim.term_11
	vim.g.terminal_color_12 = lvim.term_12
	vim.g.terminal_color_13 = lvim.term_13
	vim.g.terminal_color_14 = lvim.term_14
	vim.g.terminal_color_15 = lvim.term_15
end

function lvim.highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

function lvim.load_syntax()
	local syntax = {
		Normal = { fg = lvim.fg, bg = lvim.bg_03 },
		Terminal = { fg = lvim.fg, bg = lvim.bg_03 },
		SignColumn = { fg = lvim.fg, bg = lvim.none },
		FoldColumn = { fg = lvim.color_10, bg = lvim.none },
		VertSplit = { fg = lvim.hl_02, bg = lvim.none },
		Folded = { fg = lvim.fg, bg = lvim.hl_02 },
		EndOfBuffer = { fg = lvim.bg_02, bg = lvim.none },
		IncSearch = { fg = lvim.bg_03, bg = lvim.color_10 },
		Search = { fg = lvim.bg_03, bg = lvim.color_10 },
		ColorColumn = { fg = lvim.none, bg = lvim.bg_02 },
		Conceal = { fg = lvim.color_12, bg = lvim.none },
		Cursor = { fg = lvim.none, bg = lvim.none, style = "reverse" },
		vCursor = { fg = lvim.none, bg = lvim.none, style = "reverse" },
		iCursor = { fg = lvim.none, bg = lvim.none, style = "reverse" },
		lCursor = { fg = lvim.none, bg = lvim.none, style = "reverse" },
		CursorIM = { fg = lvim.none, bg = lvim.none, style = "reverse" },
		CursorColumn = { fg = lvim.none, bg = lvim.bg_02 },
		CursorLine = { fg = lvim.none, bg = lvim.bg_02 },
		LineNr = { fg = lvim.hl_01, bg = lvim.none },
		qfLineNr = { fg = lvim.color_5, bg = lvim.none },
		CursorLineNr = { fg = lvim.color_5, bg = lvim.none },
		DiffAdd = { fg = lvim.bg_02, bg = lvim.color_6 },
		DiffChange = { fg = lvim.bg_02, bg = lvim.color_3 },
		DiffDelete = { fg = lvim.bg_02, bg = lvim.color_0 },
		DiffText = { fg = lvim.bg_02, bg = lvim.fg },
		Directory = { fg = lvim.color_8, bg = lvim.none },
		ErrorMsg = { fg = lvim.color_error, bg = lvim.none },
		WarningMsg = { fg = lvim.color_warning, bg = lvim.none },
		ModeMsg = { fg = lvim.color_6, bg = lvim.none },
		FocusedSymbol = { fg = lvim.color_5 },
		MatchParen = { fg = lvim.color_0, bg = lvim.none },
		NonText = { fg = lvim.fg },
		Whitespace = { fg = lvim.bg_02 },
		SpecialKey = { fg = lvim.fg },
		Pmenu = { fg = lvim.color_10, bg = lvim.bg_02 },
		PmenuSel = { fg = lvim.bg_03, bg = lvim.color_10 },
		PmenuSelBold = { fg = lvim.bg_03, bg = lvim.color_10 },
		PmenuSbar = { fg = lvim.none, bg = lvim.bg_02 },
		PmenuThumb = { fg = lvim.color_9, bg = lvim.color_4 },
		WildMenu = { fg = lvim.color_10, bg = lvim.color_5 },
		Question = { fg = lvim.color_3 },
		Tabline = { fg = lvim.color_10, bg = lvim.none },
		TabLineFill = { style = lvim.none },
		TabLineSel = { fg = lvim.fg, bg = lvim.none },
		StatusLine = { fg = lvim.color_13, bg = lvim.bg_02, style = lvim.none },
		StatusLineNC = { fg = lvim.color_12, bg = lvim.bg_02, style = lvim.none },
		SpellBad = { fg = lvim.bg_02, bg = lvim.color_7 },
		SpellCap = { fg = lvim.bg_02, bg = lvim.color_7 },
		SpellLocal = { fg = lvim.bg_02, bg = lvim.color_7 },
		SpellRare = { fg = lvim.bg_02, bg = lvim.color_7 },
		Visual = { fg = lvim.color_12, bg = lvim.bg_02 },
		VisualNOS = { fg = lvim.color_12, bg = lvim.bg_02 },
		QuickFixLine = { fg = lvim.color_9 },
		Debug = { fg = lvim.color_2 },
		debugBreakpoint = { fg = lvim.bg_03, bg = lvim.color_0 },
		Boolean = { fg = lvim.color_2 },
		Number = { fg = lvim.color_13 },
		Float = { fg = lvim.fg, bg = lvim.bg_01 },
		NormalFloat = { fg = lvim.fg, bg = lvim.bg_01 },
		FloatBorder = { fg = lvim.bg_01, bg = lvim.bg_01 },
		PreProc = { fg = lvim.color_9 },
		PreCondit = { fg = lvim.color_9 },
		Include = { fg = lvim.color_9 },
		Define = { fg = lvim.color_3 },
		Conditional = { fg = lvim.color_5 },
		Repeat = { fg = lvim.color_10 },
		Keyword = { fg = lvim.color_2 },
		Typedef = { fg = lvim.color_0 },
		Exception = { fg = lvim.color_0 },
		Statement = { fg = lvim.color_0 },
		Error = { fg = lvim.color_error },
		StorageClass = { fg = lvim.color_2 },
		Tag = { fg = lvim.color_8 },
		Label = { fg = lvim.color_2 },
		Structure = { fg = lvim.color_2 },
		Operator = { fg = lvim.color_5 },
		Title = { fg = lvim.color_2 },
		Special = { fg = lvim.fg },
		SpecialChar = { fg = lvim.fg },
		Type = { fg = lvim.color_11 },
		Function = { fg = lvim.color_3 },
		String = { fg = lvim.color_4 },
		Character = { fg = lvim.color_5 },
		Constant = { fg = lvim.color_7 },
		Macro = { fg = lvim.color_7 },
		Identifier = { fg = lvim.color_8 },
		Comment = { fg = lvim.color_6 },
		SpecialComment = { fg = lvim.color_6 },
		Todo = { fg = lvim.color_6 },
		Delimiter = { fg = lvim.color_5 },
		Ignore = { fg = lvim.color_12 },
		Underlined = { style = "underline" },
		Bold = { style = "bold" },
		Italic = { style = "italic" },
		DashboardShortCut = { fg = lvim.color_10 },
		DashboardHeader = { fg = lvim.color_0 },
		DashboardCenter = { fg = lvim.color_7 },
		DashboardFooter = { fg = lvim.color_5 },
	}
	return syntax
end

function lvim.load_plugin_syntax()
	local plugin_syntax = {
		VimwikiHeader1 = { fg = palette.orange.bright, style = "bold" },
		VimwikiHeader2 = { fg = palette.blue.bright, style = "bold" },
		VimwikiHeader3 = { fg = palette.cyan.bright },
		VimwikiHeader4 = { fg = palette.orange.dim },
		VimwikiHeader5 = { fg = palette.blue.dim },
		VimwikiHeader6 = { fg = palette.cyan.dim },
		Vimwikigrey = { fg = palette.black.dim },
		Vimwikigreen = { fg = palette.green.base },
		Vimwikiorange = { fg = palette.orange.base },
		Vimwikipurple = { fg = palette.magenta.base },
		Vimwikired = { fg = palette.red.base },
		VimwikiBold = { bg = palette.bg3, fg = palette.yellow.base },
		VimwikiItalic = { bg = palette.bg3, fg = palette.pink.base },
		Vimwikiyellow = { fg = palette.yellow.base },
		VimwikiLink = { fg = palette.blue.base, style = "underline" },
		VimwikiHeaderChar = { fg = lvim.color_6 },
		VimwikiHR = { fg = lvim.color_12 },
		VimwikiList = { fg = palette.blue.base },
		VimwikiTag = { fg = lvim.color_1 },
		HopNextKey = { fg = lvim.color_7, style = "bold" },
		HopNextKey1 = { fg = lvim.color_8, style = "bold" },
		HopNextKey2 = { fg = lvim.color_10, style = "bold" },
		HopUnmatched = { fg = lvim.color_6, sp = lvim.color_6 },
		RatingOW = { bg = lvim.color_success, fg = palette.bg0 },
		RatingOWTactical = { bg = palette.green.dim, fg = palette.bg0 },
		RatingN = { bg = palette.orange.bright, fg = palette.bg0 },
		RatingUW = { bg = palette.red.base, fg = black },
		RatingUWTactical = { bg = palette.red.dim, fg = black },
		texSnip = { fg = lvim.color_1 },
	}
	return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
	-- lvim.terminal_color()
	local syntax = lvim.load_plugin_syntax()
	for group, colors in pairs(syntax) do
		lvim.highlight(group, colors)
	end
	async_load_plugin:close()
end))

function lvim.colorscheme()
	-- vim.api.nvim_command("hi clear")
	-- if vim.fn.exists("syntax_on") then
	-- 	vim.api.nvim_command("syntax reset")
	-- end
	-- vim.o.background = "dark"
	-- vim.o.termguicolors = true
	-- vim.g.colors_name = "lvim"
	-- local syntax = lvim.load_syntax()
	-- for group, colors in pairs(syntax) do
	-- lvim.highlight(group, colors)
	-- end

	-- Get rid  of an error message where no background highlight color is set for Normal group
	-- vim.api.nvim_command("highlight " .. "Normal" .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)

	async_load_plugin:send()
end

lvim.colorscheme()
