local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Close specific filetypes with <q>
autocmd("FileType", {
	-- Add other filetypes to the list if needed
	pattern = {
		"help",
		"man",
		"lspinfo",
		"checkhealth",
		"qf", -- quickfix
		"query",
	},
	callback = function(event)
		-- Disable buffer in buffer list
		vim.bo[event.buf].buflisted = false
		-- Map 'q' to close window
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
