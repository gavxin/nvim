return {
  "simrat39/rust-tools.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },
}
