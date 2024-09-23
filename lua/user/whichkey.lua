local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- not needed anymore, as we are using the setup function
local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  win = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 40 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  --ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  -- filters = { show = false },
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = { "<auto>", mode = "nixsotc" }, -- automatically setup triggers
  triggers = {
    { "<leader>", mode = { "n", "v" } },
  },
--   defer = function(ctx)
--   if vim.tbl_contains({ "d", "y" }, ctx.operator) then
--     return true
--   end
--   return vim.tbl_contains({ "v", "V", "<C-v>" }, ctx.mode)
-- end,
  -- or specify a list manually
  -- triggers_blacklist = {
  --   -- list of mode / prefixes that should never be hooked by WhichKey
  --   -- this is mostly relevant for key maps that start with a native binding
  --   -- most people should not need to change this
  --   i = { "j", "k" },
  --   v = { "j", "k" },
  -- },
}
-- which_key.setup(setup)

-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- Add group names
-- which_key.add({
--   p = { name = 'Packer' },
--   g = { name = 'Git'  },
--   l = { name = 'LSP' },
--   s = { name = 'Search' },
--   t = { name = 'Terminal' },},
--   { prefix = "<leader>"
--   -- Define non-keymap 'g' mappings
-- })


  -- Set your keymaps with descriptions
which_key.add({
  mode = "n", -- NORMAL mode
  {'<leader>a', '<cmd>Alpha<cr>', desc = 'Alpha' },
  {'<leader>b', "<cmd>Telescope buffers<cr>",  desc = 'Buffers' },
  {'<leader>e', '<cmd>NvimTreeToggle<cr>',  desc = 'Explorer' },
  {'<leader>w', '<cmd>w!<CR>',  desc = 'Save' },
  {'<leader>q', '<cmd>q!<CR>', desc = 'Quit' },
  {'<leader>c', '<cmd>Bdelete!<CR>', desc = 'Close Buffer' },
  {'<leader>h', '<cmd>nohlsearch<CR>', desc = 'No Highlight' },
  {'<leader>f', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = true})<cr>", desc = 'Find Files' },
  {'<leader>F', "<cmd>Telescope live_grep theme=ivy<cr>", desc = 'Fuzzy Find' },
  {'<leader>P', "<cmd>lua require('telescope').extensions.projects.projects()<cr>",  desc = 'Projects' },

  -- Packer
  {'<leader>p', group = 'Packer'},
  {'<leader>pi', '<cmd>PackerInstall<CR>', desc = 'Install' },
  {'<leader>pu', '<cmd>PackerUpdate<CR>', desc = 'Update' },
  {'<leader>pc', '<cmd>PackerCompile<CR>', desc = 'Compile' },
  {'<leader>ps', '<cmd>PackerStatus<CR>', desc = 'Status' },
  {'<leader>pl', '<cmd>PackerSync<CR>', desc = 'Sync' },
  {'<leader>pp', '<cmd>PackerProfile<CR>', desc = 'Profile' },

  -- Git
  {'<leader>g', group = 'Git'},
  { '<leader>gj', "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = 'Next Hunk' },
  { '<leader>gg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', desc = 'LazyGit' },
  { '<leader>gk', "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = 'Prev Hunk' },
  { '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = 'Blame Line' },
  { '<leader>gp', "<cmd>lua require 'gitsigns'.preview_hunk()<cr>" , desc = 'Preview Hunk' },
  { '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = 'Reset Hunk' },
  { '<leader>gR', "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = 'Reset Buffer' },
  { '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = 'Stage Hunk' },
  { '<leader>gu', "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = 'Undo Stage Hunk' },
  { '<leader>go', "<cmd>Telescope git_status<cr>", desc = 'Git Status' },
  { '<leader>gb', "<cmd>Telescope git_branches<cr>", desc = 'Git Branches' },
  { '<leader>gc', "<cmd>Telescope git_commits<cr>", desc = 'Git Commits' },
  { '<leader>gd', "<cmd>Telescope git_diff<cr>", desc = 'Git Diff' },

  -- LSP 
  { '<leader>l', group = 'LSP'},
  { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', desc = 'Code Action' },
  { '<leader>lD', '<cmd>lua vim.lsp.buf.definition()<CR>', desc = 'Definition' },
  { '<leader>ld', '<cmd>Telescope diagnostics bufnr=0<CR>', desc = 'Document Diagnostics' },
  { '<leader>lw', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace Diagnostics' },
  { '<leader>lR', '<cmd>lua vim.lsp.buf.references()<CR>', desc = 'References' },
  { '<leader>lf', '<cmd>lua vim.lsp.buf.format{async=true}<cr>', desc = 'Format' },
  { '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<CR>', desc = 'Hover'},
  { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Info' },
  { '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = 'Implementations' },
  { '<leader>lj', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', desc = 'Next Diagnostic' },
  { '<leader>lk', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', desc = 'Prev Diagnostic' },
  { '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', desc = 'CodeLens' },
  { '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<cr>', desc = 'Quickfix' },
  { '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename' },
  { '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document Symbols' },
  { '<leader>lS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Workspace Symbols' },

  -- Search

  { '<leader>s', group = 'Search'},
  { '<leader>sb', '<cmd>Telescope git_branches<cr>', desc = 'Checkout branch' },
  { '<leader>sc', '<cmd>Telescope colorscheme<cr>', desc = 'Colorscheme' },
  { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
  { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
  { '<leader>sr', '<cmd>Telescope oldfiles<cr>', desc = 'Open Recent' },
  { '<leader>sR', '<cmd>Telescope registers<cr>', desc = 'Registers' },
  { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
  { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },


  { '<leader>t', group = 'Terminal'},
  { '<leader>tn', '<cmd>lua _NODE_TOGGLE()<cr>', desc = 'node' },
  { '<leader>tu', '<cmd>lua _NCDU_TOGGLE()<cr>', desc = 'NCDU' },
  { '<leader>tt', '<cmd>lua _HTOP_TOGGLE()<cr>', desc = 'htop' },
  { '<leader>tp', '<cmd>lua _PYTHON_TOGGLE()<cr>', desc = 'Python' },
  { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Float' },
  { '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'Horizontal' },
  { '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'Vertical' },

}
)




-- LSP


  --{'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', desc = 'Float Diagnostics'}
--which_key.register(mappings, opts)














