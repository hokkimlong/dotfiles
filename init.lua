-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
    -- stylua: ignore
    keys = {
      { "<CR>", mode = { "n"  }, function() require("flash").jump() end, desc = "Flash" },
    }
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = true },
})


local map = vim.keymap.set -- general mappings 

  map("n", "<leader>s", "<ESC><cmd> w <CR>")
  
  map("n", "<leader>bd", "<cmd> bd <CR>")
  map("n", "<leader>/","<cmd>lua require('vscode').action('editor.action.commentLine')<CR>")

  map("n", "J", "L4j")
  map("n", "K", "H4k")
  
  map("n",";e", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
  map("n",";a", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
  map("n",";n", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
  map("n",";l", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
  map("n",";1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
  map("n",";2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
  map("n",";3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
  map("n","<leader>q", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
  
  map("n",";;", "<cmd>lua require('vscode').action('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>")

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
