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

-- Diagnostic navigation
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Next Error" })
vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Prev Error" })
vim.keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Next Warning" })
vim.keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Prev Warning" })

-- LSP jump functionality
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

-- Document highlight navigation
vim.keymap.set("n", "]]", function() vim.lsp.buf.document_highlight() vim.diagnostic.goto_next() end, { desc = "Next Reference" })
vim.keymap.set("n", "[[", function() vim.lsp.buf.document_highlight() vim.diagnostic.goto_prev() end, { desc = "Prev Reference" })


return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },


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
}
