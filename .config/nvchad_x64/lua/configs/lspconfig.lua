require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "csharp_ls" }
vim.lsp.enable(servers)
