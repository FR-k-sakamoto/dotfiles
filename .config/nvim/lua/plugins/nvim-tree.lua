return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
    { "<leader>fe", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file in tree" },
  },
  init = function()
    -- nvim-tree 推奨: netrw を無効化
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    view = { width = 35 },
    renderer = {
      group_empty = true,
      indent_markers = { enable = true },
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    update_focused_file = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)

    -- nvim-tree 側の bg を透明化して wezterm の window_background_opacity を素通しさせる。
    -- 編集領域は通常の bg を保持するので wezterm の text_background_opacity が効き、少し濃いめになる。
    local function clear_tree_bg()
      for _, name in ipairs({
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeNormalFloat",
        "NvimTreeEndOfBuffer",
        "NvimTreeWinSeparator",
        "NvimTreeStatusLine",
        "NvimTreeStatusLineNC",
        "NvimTreeCursorLine",
      }) do
        vim.api.nvim_set_hl(0, name, { bg = "NONE" })
      end
    end

    clear_tree_bg()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = clear_tree_bg })
  end,
}
