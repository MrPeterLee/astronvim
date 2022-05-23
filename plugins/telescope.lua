local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return {}
end

local actions = require("telescope.actions")
local hop = telescope.extensions.hop
local trouble = require("trouble.providers.telescope")

return {
	defaults = {
		selection_caret = "  ",
		layout_config = {
			width = 0.90,
			height = 0.85,
			preview_cutoff = 120,
			horizontal = {
				preview_width = 0.6,
			},
			vertical = {
				width = 0.9,
				height = 0.95,
				preview_height = 0.5,
			},
			flex = {
				horizontal = {
					preview_width = 0.9,
				},
			},
		},
		mappings = {
			n = { ["<c-t>"] = trouble.open_with_trouble },
			i = {
				-- Trouble
				["<c-t>"] = trouble.open_with_trouble,

				-- Hop
				["<C-h>"] = hop.hop,
				["<C-space>"] = function(prompt_bufnr)
					local opts = {
						callback = actions.toggle_selection,
						loop_callback = actions.send_selected_to_qflist,
					}
					hop._hop_loop(prompt_bufnr, opts)
				end,
			},
		},
	},
	extensions = {
		project = {
			base_dirs = { { path = "/lab/paper", max_depth = 2 }, { path = "/lab/lib", max_depth = 1 } },
			hidden_files = true, -- default: false
			-- theme = "dropdown",
		},
		file_browser = {
			cwd_to_path = true,
			-- theme = "ivy",
		},
		bibtex = {
			context = true,
			context_fallback = false,
		},
		media_files = {
			filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
			find_cmd = "rg",
		},
	},
}
