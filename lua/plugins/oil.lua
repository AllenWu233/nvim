-- oil.nvim
-- File explorer: edit your filesystem like a buffer

--- Exit Neovim if in standalone mode (via 'oil' alias), else close buffer
local smart_quit = function()
	if vim.env.OIL_FM then
		vim.cmd("quitall")
	else
		require("oil").close()
	end
end
-- Use with zsh function:
-- # Use oil.nvim as file explorer
-- oil() {
--     if [ -z "$1" ]; then
--         OIL_FM=1 nvim -c "Oil"
--     else
--         OIL_FM=1 nvim -c "Oil $1"
--     fi
-- }

return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,

			float = {
				preview_split = "right",
				border = "rounded",
			},

			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = { "actions.select", opts = { tab = true } },
				["L"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-r>"] = "actions.refresh",
				["H"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
				["<esc>"] = smart_quit,
				["q"] = smart_quit,
			},
		},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
}
