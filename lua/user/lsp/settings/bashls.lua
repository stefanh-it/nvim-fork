return {
  cmd       = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  settings  = {
    bashIde = {
      shfmtPath  = "shfmt",          -- make sure `shfmt` is in $PATH
      shfmtArgs  = { "-i", "2", "-ci" },
      -- shellcheckPath = "shellcheck", -- optional linting
    },
  },
}

