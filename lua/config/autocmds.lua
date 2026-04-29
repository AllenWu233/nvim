local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- Disable automatic comment wrapping and insertion of comment leaders
autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})


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


-- -- Floating window for showing line diagnostics automatically in hover window
-- -- autocmd({ "CursorHold", "CursorHoldI" }, {
-- autocmd("CursorHold", {
-- 	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false })
-- 	end,
-- })

