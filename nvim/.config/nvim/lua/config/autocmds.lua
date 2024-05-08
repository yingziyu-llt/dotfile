-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F12>",
      ":w<CR>:split<CR>:te time python %<CR>i",
      { silent = true, noremap = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F12>",
      "<ESC>:w<CR>:split<CR>:te g++ % -o %<.run -lm -std=c++20 -Wall -Wextra -Wshadow -Dllt -fsanitize=address -g && time ./%:t:r.run<CR>i",
      { silent = true, noremap = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F5>",
      ":w<CR>:split<CR>:te python -m pdb %<CR>i",
      { silent = true, noremap = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F5>",
      "<ESC>:w<CR>:split<CR>:te g++ % -o %<.run -lm -std=c++20 -Wall -Wextra -Wshadow -Dllt -fsanitize=address -g && gdb %<.run<CR>i",
      { silent = true, noremap = true }
    )
  end,
})
