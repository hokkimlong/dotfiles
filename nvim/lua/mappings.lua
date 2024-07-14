local map = vim.keymap.set -- general mappings map("n", "<C-s>", "<cmd> w <CR>") map("i", "<C-s>", "<ESC><cmd> w <CR>")
map("n", "<leader>s", "<ESC><cmd> w <CR>")
map("n", "ss", "<ESC><cmd> w <CR>")
map("n", "ss", "<ESC><cmd> w <CR>")
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "kk", "<ESC>")

-- scroll
map("n", "J", "6<C-e>M")
map("n", "K", "6<C-y>M")

-- nvimtree
-- map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
-- map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")


-- Fzf lua
map("n", "<leader>ff", "<cmd> FzfLua files <CR>")
map("n", "<leader>fo", "<cmd> FzfLua oldfiles <CR>")
map("n", "<leader>fs", "<cmd> FzfLua lsp_document_symbols <CR>")
map("n", "<leader>fw", "<cmd> FzfLua live_grep <CR>")
map("n", "<leader>gt", "<cmd> FzfLua git_status <CR>")
map("n", "<leader>gf", "<cmd> FzfLua git_files <CR>")
map("n", "<leader>fb", "<cmd> FzfLua buffers <CR>")
map("n", "<leader>fa", "<cmd> FzfLua <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<leader>bn", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<leader>bp", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<leader>bc", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("n", "<C-/>", "gcc", { remap = true })
map("v", "<C-/>", "gc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- -- format
-- map("n", "<leader>fm", function()
--   require("conform").format()
-- end)

-- close
map("n", "<leader>q", "<cmd>q <CR>")

-- files
-- map("n", "-", "<cmd>:lua MiniFiles.open()<CR>")
map("n", "<leader>bs", "<cmd>vsplit<CR>")


-- next hunk
map("n", "[h", "<cmd>Gitsigns next_hunk<CR>")
map("n", "]h", "<cmd>Gitsigns prev_hunk<CR>")
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR><C-w>W")
