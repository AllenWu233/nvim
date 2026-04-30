local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- Remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`\"')
    end
  end,
})

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

