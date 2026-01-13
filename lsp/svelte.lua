return {
	cmd = { "svelteserver", "--stdio" },

	filetypes = { "svelte" },

	root_markers = { { "package.json" }, ".git" },
	settings = {
		svelte = {
			plugin = {
				svelte = { enabled = true },
				typescript = { enabled = true }, -- Crucial for script tags
				css = { enabled = true },
			},
		},
	},
}
