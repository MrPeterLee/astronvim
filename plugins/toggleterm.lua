return {
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.rows * 0.4
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.5
		end
	end,

	-- highlights = require("rose-pine.plugins.toggleterm"), -- this is the color scheme
	open_mapping = [[<c-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals = true,
	shading_factor = "2", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
}
