return {
	-- Available Themes
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = true,
	-- 	opts = { colors = { theme = { all = { ui = { bg_gutter = "none" } } } } },
	-- 	config = function(_, opts)
	-- 		require("kanagawa").setup(opts)
	-- 	end,
	-- },
	{ "folke/tokyonight.nvim", lazy = true },
	-- { "catppuccin/nvim", name = "catppuccin", lazy = true },

	-- Local Theme Switcher
	{
		"UserColorscheme", -- Local name
		virtual = true,
		lazy = false,
		priority = 1000,
		opts = {
			-- Change this string to switch theme
			--
			-- colorscheme = "kanagawa-wave",
			-- colorscheme = "kanagawa-dragon",
			-- colorscheme = "kanagawa-lotus",
			colorscheme = "tokyonight-moon",
			-- colorscheme = "catppuccin-mocha",
		},
		config = function(_, opts)
			if opts.colorscheme then
				vim.cmd.colorscheme(opts.colorscheme)
			end
		end,
	},
}
