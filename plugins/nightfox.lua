return {
	-- palettes = {
	-- 	-- Custom duskfox with black background
	-- 	duskfox = {
	-- 		bg1 = "#000000", -- Black background
	-- 		bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
	-- 		bg3 = "#121820", -- 55% darkened from stock
	-- 		sel0 = "#131b24", -- 55% darkened from stock
	-- 	},
	-- },

	options = {
		dim_inactive = true,
		transparent = true, -- transparent background
		styles = {
			comments = "italic",
		},
		inverse = {
			match_paren = true,
		},
		modules = {
			barbar = false,
			dashboard = false,
			fern = false,
			fidget = false,
			gitgutter = false,
			illuminate = false,
			lightspeed = false,
			lsp_saga = false,
			lsp_trouble = false,
			modes = false,
			neogit = false,
			nvimtree = false,
			pounce = false,
			sneak = false,
		},
	},
	groups = {
		all = {
			MiniIndentscopeSymbol = { link = "PreProc" },
			NormalFloat = { link = "Normal" },
			TelescopeBorder = { bg = "bg1" },
			TelescopePromptCounter = { link = "TelescopePromptNormal" },
			TelescopePromptPrefix = { link = "TelescopePromptNormal" },
		},
	},
}
