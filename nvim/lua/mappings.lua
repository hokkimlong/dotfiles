local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "<C-s>", "<ESC><cmd> w <CR>")
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "kk", "<ESC>")


-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope git_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<leader>bn", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<leader>bp", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<leader>bc", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>fm", function()
  require("conform").format()
end)

-- toggle 2
map("n",'aa','<C-^>')

-- close
map("n","<leader>q", "<cmd>q <CR>")
