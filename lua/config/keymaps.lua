local map = vim.keymap.set

map("n", "<C-S>", ":w", { desc = "Save edit" })

map("n", "<C-A>", function()
	vim.cmd("normal! ggVGy")
	vim.notify("Buffer content copied")
end, { desc = "Copy All" })

map("n", "<C-X>", "ggdG", { desc = "Delete All" })
map("n", "<leader>=", "gg=G", { desc = "Auto Indent" })
map({ "n", "v", "i", "s" }, "<C-s>", "<cmd>write<cr><esc>", { desc = "Save File" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>fn", "<cmd>new<cr>", { desc = "New File" })
map("n", "L", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "H", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "X", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear Search Highlight" })
map("n", "<leader>a", "za", { desc = "Toggle fold under cursor" })
map("n", "<leader>A", "zA", { desc = "Toggle all folds under cursor" })
map("n", "<leader>z", "z", { desc = "" })

-- Toggle line wrap
map("n", "<leader>uw", function()
	vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle line wrap" })

-- Command
--
-- Alias :h to :tab h
vim.cmd([[cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "h" ? "tab help" : "h"]])

-- Toggle autoformat globally
map("n", "<leader>uf", function()
	-- Toggle global variable state
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	local status = vim.g.disable_autoformat and "Disabled" or "Enabled"
	vim.notify("Auto format (Global) " .. status)
end, { desc = "Toggle Auto Format (Global)" })

-- Toggle autoformat for current buffer
map("n", "<leader>uF", function()
	-- Toggle buffer variable state
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	local status = vim.b.disable_autoformat and "Disabled" or "Enabled"
	vim.notify("Auto format (Buffer)" .. status)
end, { desc = "Toggle Auto Format (Buffer)" })

-- Toggle floating terminal
vim.keymap.set({ "n", "t" }, "<leader>ft", function()
	-- Using Snacks.terminal if available, or native term
	-- if _G.Snacks then
	-- 	_G.Snacks.terminal.toggle()
	-- else
	vim.cmd("split | term") -- Fallback to simple split
	-- end
end, { desc = "Floating Terminal" })

-- Plugins
--
map("n", "<leader>e", "<cmd>Oil --float --preview<cr><esc>", { desc = "Open Oil File Explorer" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
