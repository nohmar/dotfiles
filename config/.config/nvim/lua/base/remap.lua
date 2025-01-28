vim.g.mapleader = " "

-- Update a file
vim.keymap.set("n", "<C-s>", vim.cmd.update)

-- Navigate to netrw
vim.keymap.set("n", "-", vim.cmd.Ex)

-- Open configuration
vim.keymap.set("n", "<leader>c", ":e $MYVIMRC<CR>")

-- Search in files
vim.keymap.set("n", "<leader>s", ":Rg <C-R><C-W><CR>")

-- Source current file
vim.keymap.set("n", "<leader>o", ":so<CR>")

-- Move lines in all modes
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<C-j>", "<ESC>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-k>", "<ESC>:m .-2<CR>==gi")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Join lines without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Delete in Visual Line mode
vim.keymap.set("x", "<bs>", [["_d]])

-- Disable clunky commands
vim.keymap.set({ "n", "v" }, "q", [[\<noop>]])
vim.keymap.set({ "n", "v" }, "q:", [[\<noop>]])
vim.keymap.set("n", "Q", [[\<noop>]])

-- Git blame
vim.keymap.set({ "n", "v" }, "<leader>B", ":Git blame<CR>")

-- Copy fully qualified path name to clipboard
vim.keymap.set("n", "<leader>f", ":let @+=expand('%:p')<CR>")

-- Dipatch
vim.keymap.set("n", "<leader>T", ":Dispatch<CR>")

-- Open diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
