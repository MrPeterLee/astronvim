-- Create a color palette from nightfox
-- local C = require("nightfox.lib.color")
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

return function(h)
	local C = require("default_theme.colors")
	-- h.TelescopeNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopeTitle = { fg = C.fg }
	-- h.TelescopeMatching = { fg = C.blue }
	-- h.TelescopePromptTitle = { fg = C.bg, bg = C.red }
	-- h.TelescopePromptNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopePromptPrefix = { fg = C.red, bg = C.bg }
	-- h.TelescopePromptCounter = { fg = C.red }
	-- h.TelescopeResultsTitle = { fg = C.bg, bg = C.bg }
	-- h.TelescopeResultsNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopePreviewTitle = { fg = C.bg, bg = C.green }
	-- h.TelescopePreviewNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopeBorder = { fg = C.bg, bg = C.bg }
	-- h.TelescopeResultsBorder = { fg = C.bg, bg = C.bg }
	-- h.TelescopePromptBorder = { fg = C.bg, bg = C.bg }
	-- h.TelescopePreviewBorder = { fg = C.bg, bg = C.bg }
	h.VimwikiHeader1 = { fg = palette.orange.bright, style = "bold" }
	h.VimwikiHeader2 = { fg = palette.blue.bright, style = "bold" }
	h.VimwikiHeader3 = { fg = palette.cyan.bright }
	h.VimwikiHeader4 = { fg = palette.orange.dim }
	h.VimwikiHeader5 = { fg = palette.blue.dim }
	h.VimwikiHeader6 = { fg = palette.cyan.dim }
	h.Vimwikigrey = { fg = palette.black.dim }
	h.Vimwikigreen = { fg = palette.green.base }
	h.Vimwikiorange = { fg = palette.orange.base }
	h.Vimwikipurple = { fg = palette.magenta.base }
	h.Vimwikired = { fg = palette.red.base }
	h.VimwikiBold = { bg = palette.bg3, fg = palette.yellow.base }
	h.VimwikiItalic = { bg = palette.bg3, fg = palette.pink.base }
	h.Vimwikiyellow = { fg = palette.yellow.base }
	h.VimwikiLink = { fg = palette.blue.base, style = "underline" }
	h.VimwikiHeaderChar = { fg = lvim.color_6 }
	h.VimwikiHR = { fg = lvim.color_12 }
	h.VimwikiList = { fg = palette.blue.base }
	h.VimwikiTag = { fg = lvim.color_1 }
	h.HopNextKey = { fg = lvim.color_7, style = "bold" }
	h.HopNextKey1 = { fg = lvim.color_8, style = "bold" }
	h.HopNextKey2 = { fg = lvim.color_10, style = "bold" }
	h.HopUnmatched = { fg = lvim.color_6, sp = lvim.color_6 }
	h.RatingOW = { bg = lvim.color_success, fg = palette.bg0 }
	h.RatingOWTactical = { bg = palette.green.dim, fg = palette.bg0 }
	h.RatingN = { bg = palette.orange.bright, fg = palette.bg0 }
	h.RatingUW = { bg = palette.red.base, fg = palette.black.base }
	h.RatingUWTactical = { bg = palette.red.dim, fg = palette.black.base }
	h.texSnip = { fg = lvim.color_1 }

	return h
end
