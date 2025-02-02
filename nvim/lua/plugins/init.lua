local plugins = {
	{ lazy = true, "nvim-lua/plenary.nvim" },
	-- theme
	{
		"LunarVim/darkplus.nvim",
		config = function() end,
	},

	-- icons, for UI related plugins
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- buffer + tab line
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		config = function()
			require("plugins.configs.bufferline")
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "branch", icon = { "󰘬" } }, "filename" },
					lualine_c = { "diff", "diagnostics" },
					lualine_x = { "filetype" },
					lualine_y = {},
					lualine_z = { "require'lsp-status'.status()" },
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- cmp sources
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			-- autopairs , autocompletes ()[] etc
			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup()

					--  cmp integration
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					local cmp = require("cmp")
					cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
		config = function()
			require("plugins.configs.cmp")
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall" },
		config = function()
			require("mason").setup()
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	-- formatting , linting
	{
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						lua = { "stylua" },
						javascript = { "prettier" },
						javascriptreact = { "prettier" },
						typescript = { "prettier" },
						typescriptreact = { "prettier" },
					},
					format_on_save = {
						-- These options will be passed to conform.format()
						timeout_ms = 500,
						lsp_format = "fallback",
					},
				})

				vim.keymap.set({ "n", "v" }, "<leader>l", function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end, { desc = "Format file or range (in visual mode)" })
			end,
		},
	},

	-- indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = { char = "│" },
				scope = { char = "│", highlight = "Comment" },
			})
		end,
	},
	-- git status on signcolumn etc
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"github/copilot.vim",
	},
	{
		"ibhagwan/fzf-lua",
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({
				-- ignore all '.lua' and '.vim' files
				file_ignore_patterns = { "%.png$", "%.svg$", "%.jpg$", "%.jpeg$", "%.webp$" },
			})
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "echasnovski/mini.icons" },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("oil").setup({
				-- Your configuration comes here
				-- or leave it empty to use the default settings
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.api.nvim_create_autocmd("User", {
				pattern = "OilEnter",
				callback = vim.schedule_wrap(function(args)
					local oil = require("oil")
					if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
						oil.open_preview()
					end
				end),
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			-- debug = true, -- Enable debugging
			-- See Configuration section for rest

			question_header = "## Me ",
			answer_header = "## Copilot ",
			error_header = "## Error ",
			separator = "##",
			show_help = false,
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.jump").setup()
			require("mini.jump2d").setup({
				view = {
					n_steps_ahead = 1,
				},
			})
			vim.keymap.set("n", "<CR>", "<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>")
		end,
	},
}

require("lazy").setup(plugins, require("lazy_config"))

-- copilot
vim.keymap.set("n", "<leader>cc", "<CMD>CopilotChatToggle<CR>", { desc = "Start Copilot" })

vim.keymap.set("v", "<leader>cc", "<CMD>CopilotChat<CR>", { desc = "Start Copilot" })
