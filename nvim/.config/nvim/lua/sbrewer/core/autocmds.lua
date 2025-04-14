---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})


-- Create an augroup for Markdown autosave
local markdown_autosave = vim.api.nvim_create_augroup("AutoSaveMarkdown", { clear = true })

-- Create an autocommand that triggers on InsertLeave, CursorHold, and CursorHoldI for *.md files
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    group = markdown_autosave,
    pattern = { "*.md" },
    command = "silent! write",
})
-- On setting the filetype to markdown, create a buffer-local mapping for dd
-- which deletes a line and then writes the file.
vim.api.nvim_create_autocmd("FileType", {
    group = markdown_autosave,
    pattern = "markdown",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', 'dd', 'dd:write<CR>', { noremap = true, silent = true })
    end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     once = true,
--     callback = vim.schedule_wrap(function()
--         vim.cmd([[
--             hi floatborder guibg=none
--             hi NormalFloat guibg=none
--
--             " telescope
--             hi TelescopeBorder guibg=none
--
--             " tressitter
--             hi TreesitterContext guibg=none
--             hi TreesitterContextLineNumber guifg=orange
--
--             " barbar - current buffer
--             hi BufferCurrent guibg=none guifg=orange
--             hi BufferCurrentADDED guibg=none
--             hi BufferCurrentCHANGED guibg=none
--             hi BufferCurrentDELETED guibg=none
--             hi BufferCurrentERROR guibg=none
--             hi BufferCurrentHINT guibg=none
--             hi BufferCurrentIcon guibg=none
--             hi BufferCurrentIndex guibg=none
--             hi BufferCurrentINFO guibg=none
--             hi BufferCurrentMod guibg=none
--             hi BufferCurrentNumber guibg=none
--             hi BufferCurrentSign guibg=none
--             hi BufferCurrentSignRight guibg=none
--             hi BufferCurrentTarget guibg=none
--             hi BufferCurrentWARN guibg=none
--
--             " barbar - inactive buffer
--             hi BufferInactive guibg=none
--             hi BufferInactiveADDED guibg=none
--             hi BufferInactiveCHANGED guibg=none
--             hi BufferInactiveDELETED guibg=none
--             hi BufferInactiveERROR guibg=none
--             hi BufferInactiveHINT guibg=none
--             hi BufferInactiveIcon guibg=none
--             hi BufferInactiveIndex guibg=none
--             hi BufferInactiveINFO guibg=none
--             hi BufferInactiveMod guibg=none
--             hi BufferInactiveNumber guibg=none
--             hi BufferInactiveSign guibg=none
--             hi BufferInactiveSignRight guibg=none
--             hi BufferInactiveTarget guibg=none
--             hi BufferInactiveWARN guibg=none
--
--             " barbar - tabline
--            hi BufferTabpageFill ctermbg=black
--         ]])
--     end),
--     group = vim.api.nvim_create_augroup("customcolorscheme", {}),
-- })
