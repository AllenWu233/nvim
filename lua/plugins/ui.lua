-- ui.lua
--
-- Modern UI replacement for messages, cmdline, and popupmenu

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					-- cmd module
					-- {
					--     function()
					--         return "%S"
					--     end,
					--     color = function() return { fg = Snacks.util.color("Statement") } end,
					-- },
					-- recording module
					-- {
					--     function()
					--         local recording = vim.fn.reg_recording()
					--         if recording == "" then return "" end
					--         return "recording @" .. recording
					--     end,
					--     cond = function() return vim.fn.reg_recording() ~= "" end,
					--     color = function() return { fg = Snacks.util.color("Constant") } end,
					-- },
					-- {
					--     function() return require("noice").api.status.command.get() end,
					--     cond = function()
					--         return package.loaded["noice"] and require("noice").api.status.command.has()
					--     end,
					--     color = function() return { fg = Snacks.util.color("Statement") } end,
					-- },
					-- {
					--     function() return require("noice").api.status.mode.get() end,
					--     cond = function()
					--         return package.loaded["noice"] and require("noice").api.status.mode.has()
					--     end,
					--     color = function() return { fg = Snacks.util.color("Constant") } end,
					-- },
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},

	-- Replaces the UI for messages, cmdline and the popupmenu
	-- lazy.nvim
	-- {
	--     "folke/noice.nvim",
	--     event = "VeryLazy",
	--     opts = {
	--         lsp = {
	--             -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	--             override = {
	--                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	--                 ["vim.lsp.util.stylize_markdown"] = true,
	--                 ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
	--             },
	--         },
	--         -- you can enable a preset for easier configuration
	--         cmdline = { view = "cmdline" },
	--         messages = {
	--             enabled = false, -- Disable message spam at the bottom
	--         },
	--         presets = {
	--             bottom_search = true, -- use a classic bottom cmdline for search
	--             -- command_palette = true, -- position the cmdline and popupmenu together
	--             long_message_to_split = true, -- long messages will be sent to a split
	--             inc_rename = false, -- enables an input dialog for inc-rename.nvim
	--             lsp_doc_border = false, -- add a border to hover docs and signature help
	--         },
	--     },
	--     dependencies = {
	--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--         "MunifTanjim/nui.nvim",
	--         -- OPTIONAL:
	--         --   `nvim-notify` is only needed, if you want to use the notification view.
	--         --   If not available, we use `mini` as the fallback
	--         -- "rcarriga/nvim-notify",
	--     },
	-- },

	-- {
	--     "rcarriga/nvim-notify",
	--     opts = {
	--         animate = false,
	--         stages = "static",
	--         render = "compact",
	--     },
	-- },

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "│",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.opt.termguicolors = true
			require("nvim-highlight-colors").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
		},
		-- 	on_attach = function(buffer)
		-- 		local gs = package.loaded.gitsigns
		--
		-- 		local function map(mode, l, r, desc)
		-- 			vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
		-- 		end
		--
		--     -- stylua: ignore start
		--     map("n", "]h", function()
		--       if vim.wo.diff then
		--         vim.cmd.normal({ "]c", bang = true })
		--       else
		--         gs.nav_hunk("next")
		--       end
		--     end, "Next Hunk")
		--     map("n", "[h", function()
		--       if vim.wo.diff then
		--         vim.cmd.normal({ "[c", bang = true })
		--       else
		--         gs.nav_hunk("prev")
		--       end
		--     end, "Prev Hunk")
		--     map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
		--     map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
		--     map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
		--     map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
		--     map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
		--     map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
		--     map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
		--     map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
		--     map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
		--     map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
		--     map("n", "<leader>ghd", gs.diffthis, "Diff This")
		--     map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
		--     map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
		-- 	end,
		-- },
	},
}
