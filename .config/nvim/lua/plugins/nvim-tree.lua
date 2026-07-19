return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "聚焦文件树" },
      { "<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "切换文件树" },
    },
    opts = {
      view = { side = "left", width = 32 },
      renderer = { group_empty = true },
      update_focused_file = { enable = true },
      hijack_directories = { enable = true, auto_open = true },
      git = { enable = true },
      diagnostics = { enable = true },
    },
  },
}
