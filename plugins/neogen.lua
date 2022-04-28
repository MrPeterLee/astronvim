return {
	snippet_engine = "luasnip",
	languages = {
		python = {
			template = {
				-- annotation_convention = "google_docstrings",
				annotation_convention = "numpydoc",
			},
		},
		typescript = {
			template = {
				annotation_convention = "tsdoc",
			},
		},
		typescriptreact = {
			template = {
				annotation_convention = "tsdoc",
			},
		},
	},
}
