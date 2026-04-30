local autocmd = vim.api.nvim_create_autocmd

-- Remember cursor position
autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"')
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

-- Set identation for specific filetypes
local set_indentation = function(pattern, indentation)
	autocmd({ "FileType" }, {
		pattern = pattern,
		callback = function()
			vim.opt.shiftwidth = indentation
			vim.opt.tabstop = indentation
		end,
	})
end
set_indentation({ "lua", "html", "beancount", "ledger" }, 2)

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
