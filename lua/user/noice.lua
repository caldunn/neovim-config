require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp

      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.extract_stacktrace"] = false,
      ["renderer.lsp.hover"] = false, -- This is the big one
    },
  },
})
