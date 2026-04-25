return {
	"nvim-mini/mini.nvim",
	version = false,
	opts = {},

	config = function(_, opts)
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()

		require("mini.starter").setup()
		require("mini.statusline").setup()
		require("mini.tabline").setup()
		-- require("mini.command").setup({})
		require("mini.notify").setup()
		require("mini.indentscope").setup()
	end,
}
