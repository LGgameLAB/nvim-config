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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
		-- {
	-- 	"iagorrr/noctishc.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme noctishc]])
	-- 	end,
	-- 	opts = ...
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		}
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
			ensure_installed = { "lua", "python", "c", "cpp", "vim", "bash" }, -- Add languages you use
			highlight = { enable = true },
			indent = { enable = true },
		})
		end,
	}
}
