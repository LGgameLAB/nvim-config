return
	{
		{
			"catppuccin/nvim",
			name = "catppuccin",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			flavour = "mocha",
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme catppuccin]])
			end
		},
		{ 'wakatime/vim-wakatime', lazy = false },
        {"lewis6991/gitsigns.nvim"},
        {
            "nvim-treesitter/nvim-treesitter-context",
            dependencies = "nvim-treesitter/nvim-treesitter",
            config = true,
        },

		-- {
		-- 	"lukas-reineke/indent-blankline.nvim",
		-- 	main = "ibl",
		-- 	---@module "ibl"
		-- 	---@type ibl.config
		-- 	opts = {},
		-- },
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
			},
		},
		{
			'romgrk/barbar.nvim',
			dependencies = {
				'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
				'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
			},
			init = function() vim.g.barbar_auto_setup = false end,
			opts = {
				-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
				-- animation = true,
				-- insert_at_start = true,
				-- …etc.
			},
			version = '^1.0.0', -- optional: only update when a new 1.x version is released

		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "lua", "python", "c", "cpp", "vim", "bash", "glsl"}, -- Add languages you use
					highlight = { enable = true },
					indent = { enable = true },
				})
			end,
		},
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end
		},
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "pyright" }, -- Add language servers here
					automatic_installation = true,
				})
			end
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = { "williamboman/mason-lspconfig.nvim" },
			config = function()
				local lspconfig = require("lspconfig")
				local cmp_nvim_lsp = require("cmp_nvim_lsp")
				-- Get uv virtual environment path
				-- local uv_venv = vim.fn.system("uv venv"):gsub("\\n", "")
				local python_path = vim.fn.system("which python"):gsub("\\n", "")
				-- Enable LSP-based autocompletion
				local capabilities = cmp_nvim_lsp.default_capabilities()
				-- Setup Pyright
				lspconfig.pyright.setup({
					settings = {
						python = {
							pythonPath = python_path,
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							}
						}
					}
				})
			end

		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
			},
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")

				cmp.setup({
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<Tab>"] = cmp.mapping.select_next_item(),
						["<S-Tab>"] = cmp.mapping.select_prev_item(),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
					}, {
							{ name = "buffer" },
						}),
				})
			end
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			options = { theme = 'catppuccin' },
			config = function()
				require("lualine").setup()
			end,

		},
        {
              "goolord/alpha-nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
            config = function()
              -- local startify = require("alpha.themes.startify")
              local alpha = require("alpha")
              local dashboard = require("alpha.themes.dashboard")

              -- Header
              dashboard.section.header.val = {
              " ██████╗ ███████╗████████╗     ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗     ██████╗ ██╗████████╗ ██████╗██╗  ██╗",
              "██╔════╝ ██╔════╝╚══██╔══╝    ██╔════╝██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝     ██╔══██╗██║╚══██╔══╝██╔════╝██║  ██║",
              "██║  ███╗█████╗     ██║       ██║     ██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██████╔╝██║   ██║   ██║     ███████║",
              "██║   ██║██╔══╝     ██║       ██║     ██║   ██║██║  ██║██║██║╚██╗██║██║   ██║    ██╔══██╗██║   ██║   ██║     ██╔══██║",
              "╚██████╔╝███████╗   ██║       ╚██████╗╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝    ██████╔╝██║   ██║   ╚██████╗██║  ██║",
              " ╚═════╝ ╚══════╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝"

              }

              -- Menu buttons
              dashboard.section.buttons.val = {
                dashboard.button("f", "󰍉  Find file", ":Telescope find_files<CR>"),
                dashboard.button("r", "󱋡  Recent files", ":Telescope oldfiles<CR>"),
                dashboard.button("d", "󰉋  Open Folder", ":Telescope fd find_command=fd,-t=d"), --Telescope file_browser<CR>"),
                dashboard.button("p", "󰏖  Projects", ":Telescope projects<CR>"),
                dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button("q", "󰩈  Quit NVIM", ":qa<CR>"),
              }

              -- Footer
              dashboard.section.footer.val = "Welcome to Neovim, Luke!"
              for _, el in pairs(dashboard.section.buttons.val) do
                  el.opts.position = "left"
                  -- el.opts.width = 50 -- Set a width for centering
              end
              dashboard.opts.position = "left"

              alpha.setup(dashboard.opts)
              -- alpha.setup(startify.config)
          end,
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { 'nvim-lua/plenary.nvim'},

        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
            dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        },
        {
          "ibhagwan/fzf-lua",
          -- optional for icon support
          dependencies = { "nvim-tree/nvim-web-devicons" },
          -- or if using mini.icons/mini.nvim
          -- dependencies = { "nvim-mini/mini.icons" },
          opts = {}
        },
        ---@module "neominimap.config.meta"
        {
          "Isrothy/neominimap.nvim",
          version = "v3.x.x",
          lazy = false, -- NOTE: NO NEED to Lazy load
          -- Optional. You can also set your own keybindings
          keys = {
            -- Global Minimap Controls
            { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
            { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
            { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
            { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

            -- Window-Specific Minimap Controls
            { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
            { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
            { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
            { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

            -- Tab-Specific Minimap Controls
            { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
            { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
            { "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
            { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

            -- Buffer-Specific Minimap Controls
            { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
            { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
            { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
            { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

            ---Focus Controls
            { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
            { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
            { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
          },
          init = function()
            -- The following options are recommended when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36 -- Set a large value

            --- Put your configuration here
            ---@type Neominimap.UserConfig
            vim.g.neominimap = {
              render = {
                highlight = false
              },
              git = {
                    enabled = true
                },
              treesitter = {
                    enabled = true
                },
              diagnostic = {enabled=false}
            }
          end,
          config = function ()
              render = {
                highlight = false
              }
        end

        }

	}
