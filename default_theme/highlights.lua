return function(h)
	local C = require("default_theme.colors")
	-- h.TelescopeNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopeTitle = { fg = C.fg }
	-- h.TelescopeMatching = { fg = C.blue }
	--
	h.TelescopePromptTitle = { fg = C.bg, bg = C.blue }
	h.TelescopePromptNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopePromptPrefix = { fg = C.red, bg = C.bg }
	-- h.TelescopePromptCounter = { fg = C.red }
	h.TelescopeResultsTitle = { fg = C.bg, bg = C.bg }
	h.TelescopeResultsNormal = { fg = C.fg, bg = C.bg }

	h.TelescopePreviewTitle = { fg = C.bg, bg = C.green }
	h.TelescopePreviewNormal = { fg = C.fg, bg = C.bg }
	-- h.TelescopeBorder = { fg = C.bg, bg = C.bg }
	-- h.TelescopeResultsBorder = { fg = C.bg, bg = C.bg }
	-- h.TelescopePromptBorder = { fg = C.bg, bg = C.bg }
	-- h.TelescopePreviewBorder = { fg = C.bg, bg = C.bg }
	h.SpellBad = { fg = C.fg, style = "undercurl" }
	h.SpellCap = { fg = C.fg, bg = C.grey_3, style = "undercurl" }
	h.SpellLocal = { fg = C.fg }

	h.VimwikiHeader1 = { fg = C.gold, style = "bold" }
	h.VimwikiHeader2 = { fg = C.css, style = "bold" }
	h.VimwikiHeader3 = { fg = C.orange_2, style = "bold" }
	h.VimwikiHeader4 = { fg = C.green_1 }
	h.VimwikiHeader5 = { fg = C.purple_1 }
	h.VimwikiHeader6 = { fg = C.yellow_2 }
	h.VimwikiHeaderChar = { fg = C.blue_2 }
	h.VimwikiList = { fg = C.green }
	h.VimwikiListTodo = { fg = C.green }
	h.VimwikiItalic = { bg = C.grey_3, fg = C.purple }
	h.VimwikiCode = { fg = C.cyan }
	h.VimwikiBold = { bg = C.grey_3, fg = C.gold }
	h.Vimwikigrey = { fg = C.grey }
	h.Vimwikigreen = { fg = C.green }
	h.Vimwikiorange = { fg = C.orange }
	h.Vimwikipurple = { fg = C.purple }
	h.Vimwikired = { fg = C.red }
	h.Vimwikiyellow = { fg = C.yellow }
	h.VimwikiLink = { fg = C.blue, style = "underline" }
	h.VimwikiHR = { fg = C.c }
	h.VimwikiTag = { fg = C.cyan }
	h.RatingOW = { bg = C.toml, fg = C.white }
	h.RatingOWTactical = { bg = C.toml, fg = C.white }
	h.RatingN = { bg = C.orange_2, fg = C.white }
	h.RatingUW = { bg = C.red_1, fg = C.white }
	h.RatingUWTactical = { bg = C.red_1, fg = C.white }

	return h
end
