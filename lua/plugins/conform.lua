return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				toml = { "taplo" },
				markdown = { "marksman" },

				json = { "prettier" },
				yaml = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },

				shell = { "shfmt" },
				bash = { "shfmt" },
			},
			-- format_on_save = {
			-- 	-- These options will be passed to conform.format()
			-- 	timeout_ms = 500,
			-- 	lsp_format = "fallback",
			-- },
			format_on_save = function(bufnr)
				-- "disable_autoformat": custom variable for toggle auto format
				-- See also: autocmds.lua
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		},
	},
}
