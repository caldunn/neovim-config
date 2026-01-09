return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { 
    "html", "css", "scss", "javascript", "javascriptreact", 
    "typescript", "typescriptreact", "svelte", "vue" 
  },
  root_dir = {
        "tailwind.config.js", 
        "tailwind.config.ts", 
        "postcss.config.js", 
        "package.json", 
        ".git" 
    
  },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        svelte = "html", -- Treat svelte content as HTML for class completions
      },
      experimental = {
        classRegex = {
          -- This allows tailwind completions inside class:functions or constants
          { "class:\\s*([^\\s>]+)", "([^\\s]+)" }, 
        },
      },
      validate = true,
    },
  },
}
