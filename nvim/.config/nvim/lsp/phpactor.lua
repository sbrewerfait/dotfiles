---@type vim.lsp.Config
return {
	cmd = { "intelephense", "--stdio" },
	root_markers = {
		"php",
		".git",
	},
	filetypes = { "php" },
    on_init = require("sbrewer.util").lua_ls_on_init,
}
