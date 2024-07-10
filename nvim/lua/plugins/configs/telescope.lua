require("telescope").setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
    },
    file_ignore_patterns = {
      "node_modules/*",
      "node_modules/",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.ico",
      "build/",
      "dist/",
      ".vscode/",
      ".github/",
      ".git/",
      ".next",
    }
  },
}
