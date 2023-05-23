

return {

    {
		"folke/neodev.nvim",
	},
	{
		cmd = "Telescope",
		keys = {
			{ "<leader>p", ":Telescope find_files<CR>", desc = "find files" },
			{ "<leader>P", ":Telescope live_grep<CR>", desc = "grep file" },
			{ "<leader>rs", ":Telescope resume<CR>", desc = "resume" },
			{ "<leader>q", ":Telescope oldfiles<CR>", desc = "oldfiles" },
		},
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                   , branch = '0.1.1',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		event = "VeryLazy",
		"hrsh7th/nvim-cmp",
		dependencies = {

			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
		},
	},

	{
		event = "VeryLazy",
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		event = "VeryLazy",
		"jose-elias-alvarez/null-ls.nvim",

		config = function()
			local null_ls = require("null-ls")

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
					null_ls.builtins.formatting.black,
				},

				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		event = "VeryLazy",
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{
		event = "VeryLazy",
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
}