-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<F5>", "<CMD> term gedit % <CR>")
vim.keymap.set("n", "<F2>", "<CMD> e %<.in <CR>")
vim.keymap.set("n", "<F3>", "<CMD> e %<.out <CR>")
vim.keymap.set("n", "<F4>", "<CMD> e %<.cpp <CR>")
