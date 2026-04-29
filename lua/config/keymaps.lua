local map = vim.keymap.set

map("n", "<C-S>", ":w", { desc = "Save edit" })
map("n", "<C-A>", "ggVGy", { desc = "Copy All" })
map("n", "<C-X>", "ggdG", { desc = "Delete All" })
map("n", "<leader>=", "gg=G", { desc = "Auto Indent" })
map({ "n", "v", "i", "s" }, "<C-s>", "<cmd>write<cr><esc>", { desc = "Save File" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>fn", "<cmd>new<cr>", { desc = "New File" })
map("n", "L", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "H", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "X", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear Search Highlight" })
map("n", "<leader>a", "za", {desc = "Toggle fold under cursor" })
map("n", "<leader>A", "zA", {desc = "Toggle all folds under cursor" })
map("n", "<leader>z", "z", {desc = "" })

-- Toggle line wrap
map("n", "<leader>uw", function()
    vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle line wrap" })

-- Command
--
-- Alias :h to :tab h
vim.cmd([[cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "h" ? "tab help" : "h"]])

-- Plugins
--
map("n", "<leader>e", "<cmd>Oil --float --preview<cr><esc>", { desc = "Open Oil File Explorer" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
