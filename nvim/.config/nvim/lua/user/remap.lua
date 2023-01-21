-- Map leader to ",".
vim.g.mapleader = ","

-- Pull up netrw file explorer.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected text up or down around other text.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When moving up and down with C-d or C-u, keep the screen centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Do the same when searching.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- With leader p, paste something without overriding the clipboard with what
-- was just pasted over.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Format buffer with lsp formatter with leader + f.
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Find and replace the current word under the cursor.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
