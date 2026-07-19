return {
  {
    "neovim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "markdown", "markdown_inline", "python", "javascript", "typescript", "tsx",
        "html", "html_tags", "css", "json", "yaml", "bash", "lua",
      })

      vim.filetype.add({ extension = { mdx = "markdown" } })
      vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "neovim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
