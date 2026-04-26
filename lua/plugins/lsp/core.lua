return {
	{
		"neovim/nvim-lspconfig",
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
				-- "black",
				"lua_ls", -- Lua
				"stylua", -- Lua Formatter
				"bashls", -- Bash
				-- "shellcheck", -- Bash Linter
				-- "shfmt", -- Bash Formatter
				"taplo", -- TOML
				"marksman", -- Markdown
				"yamlls",
				"jsonls",
				-- "prettier", -- Formatter
				-- "rust_analyzer",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
