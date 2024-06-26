local servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "eslint",
  "tailwindcss",
  "jdtls",
  "kotlin_language_server",
  "intelephense",
  "rust_analyzer",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, server in pairs(servers) do
  require("lspconfig")[server].setup {
    capabilities = capabilities
  }
end
--
-- local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status_ok then
--   return
-- end
--
-- local opts = {}
--
-- for _, server in pairs(servers) do
--   server = vim.split(server, "@")[1]
--
--   local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
--   if require_ok then
--     opts = vim.tbl_deep_extend("force", conf_opts, opts)
--   end
--
--   lspconfig[server].setup(opts)
-- end
