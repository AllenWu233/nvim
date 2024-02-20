require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").pyright.setup {
  capabilities = capabilities,
}

require("lspconfig").clangd.setup {
  capabilities = capabilities,
}

require("lspconfig").bashls.setup {
  capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}

