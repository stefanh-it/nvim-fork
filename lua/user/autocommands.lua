vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd BufEnter * lua if vim.api.nvim_win_get_config(0).relative ~= '' then vim.api.nvim_buf_set_keymap(0, 'n', '<Esc>', '<cmd>close<CR>', {noremap = true, silent = true}) end
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
    autocmd BufWritePost *.md !markdownlint %
  augroup end

  augroup _python
    autocmd!
    autocmd FileType python setlocal wrap
  augroup end

  augroup _python_env
  autocmd!
  autocmd BufEnter,BufRead,BufNewFile * if filereadable('env/bin/activate') | silent exec '!source env/bin/activate.fish' | endif
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end


  augroup _InsertCharPre
    autocmd!
    autocmd InsertCharPre * silent! call copilot#Start ()
  augroup end


]]
-- augroup _hover_behavior
-- autocmd!
-- autocmd CursorHold * lua show_diagnostics_float()
-- augroup end

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
