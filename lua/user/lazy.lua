require("lazy").setup({
	"nvim-lua/plenary.nvim",

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},

	"nvim-tree/nvim-web-devicons",

	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<Leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Tree" },
		},
		config = function()
			require("nvim-tree").setup()
		end,
	},


  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("alpha").setup(
            require("alpha.themes.startify").config
      )
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup()
    end
  },

	{
		"neovim/nvim-lspconfig",
	},

	{
		"williamboman/mason.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "sumneko_lua", "volar", "tsserver" },

				automatic_installation = true,
			})

			require("lspconfig").sumneko_lua.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },

						-- Make the server aware of Neovim runtime files
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",

		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "javascript", "typescript" },

				auto_install = true,

				highlight = {
					enable = true,
				},

				autopairs = {
					enable = true,
				},

				indent = {
					enable = true,
				},
			})
		end,
	},
})
