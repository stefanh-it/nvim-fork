local lspconfig = require'lspconfig'

lspconfig.intelephense.setup {
    cmd = { "intelephense", "--stdio" },
}
