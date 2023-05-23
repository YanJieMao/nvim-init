
local set = vim.o
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

-- cpoy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})



local opt = { noremap = true, silent = true }

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.key")
require("config.lazy")
require("config.lsp")
require("plugins.colortheme")

--theme
vim.cmd.colorscheme("base16-dracula")

