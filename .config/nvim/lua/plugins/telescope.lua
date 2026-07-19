return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "查找文件" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "全文搜索" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "查找已打开文件" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "搜索帮助" },
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top", preview_width = 0.55, width = 0.9 },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
}
