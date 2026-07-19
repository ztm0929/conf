return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    keys = {
      { "<leader>fm", function() require("conform").format({ async = true, lsp_format = "fallback" }) end, desc = "格式化文件" },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" }, javascriptreact = { "prettier" },
        typescript = { "prettier" }, typescriptreact = { "prettier" },
        json = { "prettier" }, yaml = { "prettier" }, markdown = { "prettier" }, css = { "prettier" },
        python = { "ruff_format", "ruff_organize_imports" },
      },
      default_format_opts = { lsp_format = "fallback" },
      format_on_save = { timeout_ms = 3000 },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "]c", gs.next_hunk, "下一个 Git 改动")
        map("n", "[c", gs.prev_hunk, "上一个 Git 改动")
        map("n", "<leader>hp", gs.preview_hunk, "预览 Git 改动")
        map("n", "<leader>hr", gs.reset_hunk, "还原 Git 改动块")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "查看当前行 Git 信息")
      end,
    },
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>f", group = "查找 / 格式化" },
        { "<leader>h", group = "Git 改动" },
        { "<leader>l", group = "语言服务" },
        { "<leader>r", group = "重命名" },
        { "<leader>c", group = "代码操作" },
      },
    },
  },
}
