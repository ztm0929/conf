return {
  { "mason-org/mason.nvim", lazy = false, opts = {} },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = true } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      for _, server in ipairs({ "marksman", "pyright", "ts_ls", "jsonls", "yamlls" }) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        severity_sort = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        virtual_text = { prefix = "●", spacing = 2 },
        float = { border = "rounded", source = "if_many" },
      })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "上一个诊断" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "下一个诊断" })
      vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "查看诊断" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "诊断列表" })

      local group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "跳转定义" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "查找引用" }))
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "跳转声明" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "查看说明" }))
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "重命名符号" }))
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "代码操作" }))
        end,
      })
    end,
  },
}
