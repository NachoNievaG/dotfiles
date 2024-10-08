return {
	-- Oneliners
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "github/copilot.vim" },
	{ "lervag/vimtex" },
	{ "sindrets/diffview.nvim" },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				palette_overrides = {
					gray = "#2eb542", -- comments are GREEN
				},
			})
		end,
		opts = ...,
	},
	{ "tpope/vim-fugitive" },
	{ "folke/neodev.nvim", opts = {} },
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = "onedark",
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},
	-- Setup based
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})
		end,
	},
	--LSP
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				auto_install = true,
				sync_install = false,
				ensure_installed = { "lua", "vim", "go", "bash", "markdown", "markdown_inline", "sql", "rust" },
				ignore_install = {},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = { enable = true },
				refactor = { highlight_definitions = { enable = true } },
				vim.filetype.add({
					extension = {
						tmpl = "tmpl",
					},
				}),
			})
			vim.treesitter.language.register("sql", "tmpl")
		end,
	},
	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- DAP
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{
		"leoluz/nvim-dap-go",
		init = function()
			require("dap-go").setup()
		end,
	},

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"dockerls",
					"bashls",
					"lua_ls",
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "LuaSnip" },
					{ name = "buffer" },
				},
			})
		end,
	},

	-- db
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion", "tpope/vim-dotenv" },
		config = function()
			local function db_completion()
				require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
			end
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"sql",
				},
				command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"sql",
					"mysql",
					"plsql",
				},
				callback = function()
					vim.schedule(db_completion)
				end,
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	-- TODO: Add this to the lazy.nvim repo

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	-- lazydocker.nvim
	{
		"mgierada/lazydocker.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("lazydocker").setup({})
		end,
		event = "BufRead", -- or any other event you might want to use.
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"NachoNievaG/atac.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("atac").setup({
				dir = "~/test",
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = "buffer",
		},
		config = function()
			require("ibl").setup({})
		end,
	},
	{
		"NStefan002/screenkey.nvim",
		cmd = "Screenkey",
		version = "*",
		config = true,
		disable = {
			filetypes = { "toggleterm" }, -- for example: "toggleterm"
			-- :h 'buftype'
			buftypes = { "terminal" }, -- for example: "terminal"
		},
	},
	{
		"mgierada/lazydocker.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("lazydocker").setup({})
		end,
	},
}
