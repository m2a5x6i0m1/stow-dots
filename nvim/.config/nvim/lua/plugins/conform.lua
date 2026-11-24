return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
      python = { "isort", "black" },
      lua = { "stylua --indent-type Spaces --indent-width 2" },
      nix = { "nixfmt" },
      markdown = { "prettierd" },
      json = { "prettierd" },
      css = { "prettierd" },
      qml = { "qmlformat" },
    },

    format_after_save = {
      lsp_fallback = true,
      async = true,
    },
  },
}
