local lspconfig = require'lspconfig'

lspconfig.hls.setup({
      on_attach = on_attach,
      settings = {
          haskell = {
              hlintOn = true,
              formattingProvider = "fourmolu"
          }
      },
      filetypes = { "haskell", "lhaskell", "hs"},
  root_dir = function(filepath)
    return require'lspconfig'.util.root_pattern('hie.yaml', 'stack.yaml', 'cabal.project')(filepath)
           or require'lspconfig'.util.root_pattern('*.cabal', 'package.yaml')(filepath)
  end,
  })
