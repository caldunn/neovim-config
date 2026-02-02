vim.lsp.enable({ "lua-lsp", "nil", "rust_analyzer", "svelte", "vtsls", "tailwindcss" })
local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true


M.setup = function()
	local config = {
		virtual_text = false, -- disable virtual text
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			border = "rounded",
			source = "always",
		},
    virtual_text = {
      current_line = true;
    },
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

M.on_attach = function(client, bufnr)
	if client.name == "vtsls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

-- lets use the default binds for now;
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local bind = vim.keymap.setup

	bind("n", "gD", vim.lsp.buf.declaration(), opts)
	bind("n", "gd", vim.lsp.buf.definition(), opts)
	bind("n", "K", vim.lsp.buf.hover(), opts)
	bind("n", "gI", vim.lsp.buf.implementation(), opts)
	bind("n", "gr", vim.lsp.buf.references(), opts)
	bind("n", "gl", vim.diagnostic.open_float(), opts)
	bind("n", "<leader>lf", vim.lsp.buf.format({ async = true }), opts)
	bind("n", "<leader>la", vim.lsp.buf.code_action(), opts)
	bind("n", "<leader>lr", vim.lsp.buf.rename(), opts)
	bind("n", "<leader>ls", vim.lsp.buf.signature_help(), opts)
	bind("n", "<leader>lq", vim.diagnostic.setloclist(), opts)

	-- old way i navigated diags
	-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
end

return M
