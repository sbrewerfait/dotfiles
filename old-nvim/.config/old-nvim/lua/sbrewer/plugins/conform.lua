return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = true,
        format_on_save = function(bufnr) 
            return {
                timeout_ms = 500,
                lsp_fallback = false,
            }
        end,
        formatters_by_ft = {
            c_sharp = "csharpier",
        },
    },
}
