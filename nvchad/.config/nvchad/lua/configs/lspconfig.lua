require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "csharp_ls", "intelephense" }
vim.lsp.enable(servers)
