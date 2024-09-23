-- require'lspconfig'.pylsp.setup {}

local lspconfig = require'lspconfig'

lspconfig.pylsp.setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        autopep8 = { enabled = true , args = {"--ignore=E501"} },
        pycodestyle = { enabled = false },
        pydocstyle = { enabled = false },
        pylint = { enabled = true },
        yapf = { enabled = false },
        flake8 = { enabled = true },
        jedi_completion = { enabled = true },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = true },
        jedi_symbols = { enabled = true },
        mccabe = { enabled = false },
        preload = { enabled = false },
        pyflakes = { enabled = false },
        rope_completion = { enabled = true },
        rope_completion_autoimport = { enabled = true },
        rope_goto_definition = { enabled = true },
        rope_hover = { enabled = true },
        rope_rename = { enabled = true },
      },
    },
  },
})


