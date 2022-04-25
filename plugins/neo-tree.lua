return {
	close_if_last_window = true, -- close neo-tree if it is the last window left in the tab
	window = {
		position = "float",
		width = 30,
		mappings = {
			["o"] = "open",
			["u"] = "navigate_up",
			["-"] = "open_split",
			["|"] = "open_vsplit",
			["<space>"] = "clear_filter",
			["/"] = "filter_on_submit",
		},
	},
}
