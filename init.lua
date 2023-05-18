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
--keybindings
vim.g.mapleader = " "
vim.keymap.set("n","<C-l>","<C-w>l",opt)
vim.keymap.set("n","<C-h>","<C-w>h",opt)
vim.keymap.set("n","<C-j>","<C-w>j",opt)
vim.keymap.set("n","<C-k>","<C-w>k",opt)
vim.keymap.set("n","<Leader>v","<C-w>v",opt)
vim.keymap.set("n","<Leader>s","<C-w>s",opt)
vim.keymap.set("n", "<Leader>[", "<C-o>", opt)
vim.keymap.set("n", "<Leader>]", "<C-i>", opt)
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"RRethy/nvim-base16",
		lazy = true,
	},
	{  
		"Mofiqul/dracula.nvim",
		lazy = true
	},
	
	{
	 cmd = "Telescope",
	 keys = {
	 { "<leader>p", ":Telescope find_files<CR>", desc = "find files" },
	 { "<leader>P", ":Telescope live_grep<CR>", desc = "grep file" },
	 { "<leader>rs", ":Telescope resume<CR>", desc = "resume" },
	 { "<leader>q", ":Telescope oldfiles<CR>", desc = "oldfiles" },
		},
    		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                   , branch = '0.1.1',
      		dependencies = { 'nvim-lua/plenary.nvim' }
    	},
})
--theme
vim.cmd.colorscheme("dracula")

