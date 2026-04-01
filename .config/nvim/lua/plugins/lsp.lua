return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    -- Temporarily removed :MasonUpdate due to build error on 0.12-dev
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "lua-language-server",
        "tailwindcss-language-server",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "lua_ls",
        "tailwindcss",
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      
      -- TypeScript/JavaScript indentation (2 spaces)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        callback = function()
          vim.opt_local.shiftwidth = 2
          vim.opt_local.tabstop = 2
          vim.opt_local.expandtab = true
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    config = function()
      -- Neovim 0.11+ uses vim.lsp.config and vim.lsp.enable
      -- require("lspconfig") is now deprecated for programmatic setup.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- Configure servers using vim.lsp.config
      -- Note: nvim-lspconfig still provides the default configs in lsp/ directory.
      
      -- Lua configuration
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enabled = false,
            },
          },
        },
      })

      -- Enable servers
      vim.lsp.enable({ "ts_ls", "lua_ls", "tailwindcss" })
    end,
  },
}
