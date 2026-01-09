return {
  cmd = { 'rust-analyzer' },

  filetypes = {'rs'},

  root_markers = { { 'Cargo.toml' }, '.git' },

	settings = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
      typing = {
        continueCommentsOnNewline = false,
      }
		},
}
