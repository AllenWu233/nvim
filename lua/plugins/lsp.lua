-- vim: foldmethod=marker

-- [LSP] {{{

-- [[Signs]] {{{
local signs = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " "
}
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.HINT] = signs.Hint,
            [vim.diagnostic.severity.INFO] = signs.Info,
        },
    },
})
--- }}}

-- [[Keybindings]] {{{

-- Diagnostics {{{
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

vim.keymap.set("n", "]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })

vim.keymap.set("n", "[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error" })

vim.keymap.set("n", "]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Next Warning" })

vim.keymap.set("n", "[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Prev Warning" })
---- }}}

-- LSP Info {{{
-- LSP Info (centered floating window, shows full path of command)
vim.keymap.set("n", "<leader>cl", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    vim.notify("No active LSP clients", vim.log.levels.INFO)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local lines = {}
  for _, c in ipairs(clients) do
    local ft = table.concat(c.config.filetypes or {}, ", ")
    local root = c.config.root_dir or "N/A"
    local cmd = c.config.cmd
    local cmd_str, cmd_path

    if type(cmd) == "table" then
      cmd_str = table.concat(cmd, " ")
      cmd_path = vim.fn.exepath(cmd[1]) -- Resolve full path of executable
      if cmd_path == "" then cmd_path = nil end
    elseif type(cmd) == "function" then
      cmd_str = "function"
    else
      cmd_str = tostring(cmd)
    end

    table.insert(lines, string.format("- %s (ID: %d)", c.name, c.id))
    table.insert(lines, string.format("  Filetypes: %s", ft))
    table.insert(lines, string.format("  Cmd: %s", cmd_str))
    if cmd_path then
      table.insert(lines, string.format("  Path: %s", cmd_path))
    end
    table.insert(lines, string.format("  Root dir: %s", root))
    table.insert(lines, "")
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)

  local width = 100
  local height = 30
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " LSP Clients ",
    title_pos = "center",
  })
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
end, { desc = "LSP Info" })
---- }}}

-- Code Actions & Codelens {{{
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })

vim.keymap.set("n", "<leader>cC", function()
  -- Refresh codelens by re-requesting from the server
  local params = vim.lsp.util.make_text_document_params()
  local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/codeLens" })
  for _, client in ipairs(clients) do
    client:request("textDocument/codeLens", params, nil, 0)
  end
  vim.notify("Codelens refreshed", vim.log.levels.INFO)
end, { desc = "Refresh & Display Codelens" })

vim.keymap.set("n", "<leader>cR", function()
  local old = vim.fn.expand("%")
  if old == "" then return end
  vim.ui.input({ prompt = "New file name: ", default = vim.fn.fnameescape(old) }, function(name)
    if name and name ~= "" and name ~= old then
      vim.lsp.util.rename(old, name, { overwrite = true })
    end
  end)
end, { desc = "Rename File" })

vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

vim.keymap.set("n", "<leader>cA", function()
  vim.lsp.buf.code_action({ context = { only = { "source" } }, apply = true })
end, { desc = "Source Action" })

-- Reference jumping (uses document highlights)
vim.keymap.set("n", "]]", function()
  vim.lsp.buf.document_highlight()
  -- Fallback: jump to next diagnostic if no highlights available
  vim.diagnostic.goto_next()
end, { desc = "Next Reference" })

vim.keymap.set("n", "[[", function()
  vim.lsp.buf.document_highlight()
  vim.diagnostic.goto_prev()
end, { desc = "Prev Reference" })

vim.keymap.set("n", "<a-n>", function()
  vim.lsp.buf.document_highlight()
  vim.diagnostic.goto_next()
end, { desc = "Next Reference" })

vim.keymap.set("n", "<a-p>", function()
  vim.lsp.buf.document_highlight()
  vim.diagnostic.goto_prev()
end, { desc = "Prev Reference" })
---- }}}

-- Other {{{

-- Navigation
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

-- Hover & Signature Help
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Organize Imports
vim.keymap.set("n", "<leader>co", function()
  vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
end, { desc = "Organize Imports" })

-- Symbols
vim.keymap.set("n", "<leader>ss", vim.lsp.buf.document_symbol, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", vim.lsp.buf.workspace_symbol, { desc = "LSP Workspace Symbols" })

-- Call Hierarchy
vim.keymap.set("n", "gai", vim.lsp.buf.incoming_calls, { desc = "Calls Incoming" })
vim.keymap.set("n", "gao", vim.lsp.buf.outgoing_calls, { desc = "Calls Outgoing" })

--- }}}

--- }}}

-- }}}

return {
    -- [nvim-lspconfig] {{{
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },
    -- }}}

    -- [mason] {{{
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "pyright", -- Python
                "lua_ls", -- Lua
                "stylua", -- Lua Formatter
                "bashls", -- Bash
                "taplo", -- TOML
                "marksman", -- Markdown
                "yamlls",
                "jsonls",
            },
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "black",
                "shellcheck", -- Bash Linter
                "shfmt", -- Bash Formatter
                "prettier", -- Formatter
                "rust_analyzer",
            },
        },
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
        },
    },
    -- }}}
}
