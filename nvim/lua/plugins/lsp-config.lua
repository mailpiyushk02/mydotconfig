return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false, -- ensure early loading
		config = function()
			vim.lsp.enable("lua_ls")
			-- vim.lsp.enable("pyright")
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover menu" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
		end,
	},
}
