-- mini.lua
--
-- Library of 40+ independent Lua modules
-- improving Neovim experience with minimal effort

return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		opts = {},

		config = function(_, opts)
			local icons = require("mini.icons")
			icons.setup()
			icons.mock_nvim_web_devicons()

			require("mini.starter").setup({
				-- Whether to evaluate action of single active item
				evaluate_single = true,
			})

			-- require("mini.statusline").setup()
			-- require("mini.command").setup({})
			-- require("mini.notify").setup()
			require("mini.tabline").setup()

			require("mini.indentscope").setup({
				symbol = "│",
			})

			require("mini.comment").setup()
		end,
	},
}
