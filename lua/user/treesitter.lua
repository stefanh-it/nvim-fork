local M = {
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "php" }, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = {},                                                                  -- List of parsers to ignore installing
    sync_install = false,                                                                 -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {},  -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true,
      disable = { "css" }
    },
  }
  vim.g.skip_ts_context_commentstring_enable = true
end

return M
