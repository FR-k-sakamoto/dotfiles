return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "lua",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "vim",
        "help",
        "query",
        "bash",
        "sh",
        "zsh",
        "json",
        "jsonc",
        "yaml",
        "toml",
        "markdown",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
      },
      callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
