local map = vim.keymap.set

-- INSERT mode
--
-- map("i", "jk", "<ESC>")
-- map("i", "kj", "<ESC>")
map("n", "<C-S>", ":w", { desc = "Save edit" })

-- VISUAL mode
--
-- map("v", "jk", "<ESC>")
-- map("v", "kj", "<ESC>")

-- NORMAL mode
--
map("n", "<C-A>", "ggVGy", { desc = "Copy All" })
map("n", "<C-X>", "ggdG", { desc = "Delete All" })
-- map("n", "<leader>=", "gg=G", { desc = "Auto Indent" })
map({ "n", "v", "i", "s" }, "<C-s>", "<cmd>write<cr><esc>", { desc = "Save File" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>fn", "<cmd>new<cr>", { desc = "New File" })
map("n", "L", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "H", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "X", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear Search Highlight" })

-- Plugins
--
-- map("n", "<leader>e", "<cmd>Oil --float<cr><esc>", { desc = "Open Oil File Explorer" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Toggle Oil float window
map("n", "<leader>e", function()
  -- Check if the current buffer is an Oil buffer
  if vim.bo.filetype == "oil" then
    require("oil").close()
  else
    -- Open oil in float mode
    require("oil").open_float()
  end
end, { desc = "Toggle Oil File Explorer" })
