-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

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
