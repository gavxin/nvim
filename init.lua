return {
  -- for c/c++
  lsp = {
    setup_handlers = {
      -- add custom handler
      clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
    },
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
  },
}
