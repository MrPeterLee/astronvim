return function()
	require("tmux").setup({
		-- overwrite default configuration
		-- here, e.g. to enable default bindings
		copy_sync = {
			-- enables copy sync and overwrites all register actions to
			-- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
			enable = false,

			-- TMUX >= 3.2: yanks (and deletes) will get redirected to system
			-- clipboard by tmux
			redirect_to_clipboard = false,

			-- sync clipboard overwrites vim.g.clipboard to handle * and +
			-- registers. If you sync your system clipboard without tmux, disable
			-- this option!
			sync_clipboard = true,
		},
		navigation = {
			-- cycles to opposite pane while navigating into the border
			cycle_navigation = true,

			-- enables default keybindings (C-hjkl) for normal mode
			enable_default_keybindings = false,
		},
		resize = {
			-- enables default keybindings (A-hjkl) for normal mode
			enable_default_keybindings = false,

			-- sets resize steps for x axis
			resize_step_x = 2,

			-- sets resize steps for y axis
			resize_step_y = 2,
		},
	})
end
