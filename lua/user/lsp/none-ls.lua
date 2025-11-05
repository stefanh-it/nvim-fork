
local none_ls = require("null-ls") -- the module name is still "null-ls"

none_ls.setup({
  sources = {
    -- formatters
    none_ls.builtins.formatting.black.with({
      extra_args = { "--line-length", "120" },
    }),
    none_ls.builtins.formatting.stylua,
    -- -- linting (ruff diagnostics)
    -- none_ls.builtins.diagnostics.ruff.with({
    --   extra_args = { "--line-length", "120" },
    -- }),
    -- optional: use ruff for formatting as well
    -- none_ls.builtins.formatting.ruff,
  },
})

