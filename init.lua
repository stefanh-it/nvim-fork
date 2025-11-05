require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")

require("user.telescope")
-- require "user.copilot"
require("user.gitsigns")
require("user.treesitter").config()
require("user.autopairs")
require("user.comment")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
--require "user.rainbow-delimiters"
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.options")

-- Point to neovim-node-host (installed via npm install -g neovim)
vim.g.node_host_prog = vim.fn.exepath("neovim-node-host")

-- for mason.nvim
-- prereq - install lsp server in that node/bin npm i -g typescript-language-server
-- (handled by :Mason currently)
-- vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")
