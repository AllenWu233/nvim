-- which-key.nvim
--
-- Helps remembering Neovim keymaps,
-- by showing available keybindings in a popup as typing

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			spec = {
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "Git" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
