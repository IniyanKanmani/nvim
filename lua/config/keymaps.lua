-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>', { desc = 'Turn Search Highlight Off' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<CMD>echo "Use h to move!!"<CR>', { desc = 'Ignore left arror' })
vim.keymap.set('n', '<right>', '<CMD>echo "Use l to move!!"<CR>', { desc = 'Ignore right arror' })
vim.keymap.set('n', '<up>', '<CMD>echo "Use k to move!!"<CR>', { desc = 'Ignore up arror' })
vim.keymap.set('n', '<down>', '<CMD>echo "Use j to move!!"<CR>', { desc = 'Ignore down arror' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Custom keymaps
-- vim.keymap.set({ 'i', 'v', 'x', 's', 'o', 'c' }, 'kj', '<Esc>', { desc = 'Exit to normal mode' })

vim.keymap.set('n', '<leader>kj', '<CMD>q<CR>', { desc = 'Send command :q' })
vim.keymap.set('t', '<leader>kj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set({ 'n', 'v', 'x', 's', 'o', 'c', 't' }, 'gh', '^', { desc = 'Goto start of current line' })
vim.keymap.set({ 'n', 'v', 'x', 's', 'o', 'c', 't' }, 'gl', '$', { desc = 'Goto end of current line' })

vim.keymap.set({ 'n', 'v', 'x', 's', 'o', 'c', 't' }, 'gn', '*', { desc = 'Goto next matching word' })
vim.keymap.set({ 'n', 'v', 'x', 's', 'o', 'c', 't' }, 'gN', '#', { desc = 'Goto prev matching word' })
vim.keymap.set({ 'n', 'v', 'x', 's', 'o', 'c', 't' }, 'go', '%', { desc = 'Goto other end of the braket' })

vim.keymap.set({ 'n', 'v' }, '<leader>c', '"_c', { desc = 'Change into void register' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete into void register' })
vim.keymap.set('v', '<leader>P', '"_dP', { desc = 'Paste on selection without losing the copied text' })

vim.keymap.set('n', 'vwp', '"_ciw<C-R>0<Esc>', { desc = 'Replace word with last yank' })

vim.keymap.set('n', 'du', 'V"dyP', { desc = 'Duplicate current line' })
vim.keymap.set('v', 'du', '"dyPgvo', { desc = 'Duplicate selected text' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy selection into system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Copy Line into system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<leader>sar', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace current word' })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor when <C-u>' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor when <C-d>' })

vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Center cursor when <C-b>' })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Center cursor when <C-f>' })

vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center cursor when showing prev search result' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center cursor when showing next search result' })

vim.keymap.set('n', '\\c', '<CMD>set cursorline!<CR>', { desc = 'Toggle cursorline' })
vim.keymap.set('n', '\\C', '<CMD>set cursorcolumn!<CR>', { desc = 'Toggle cursorcolumn' })

vim.keymap.set('n', '\\n', '<CMD>set number!<CR>', { desc = 'Toggle line number' })
vim.keymap.set('n', '\\r', '<CMD>set relativenumber!<CR>', { desc = 'Toggle line relativenumber' })

vim.keymap.set('n', '\\s', '<CMD>set spell!<CR>', { desc = 'Toggle spell' })
vim.keymap.set('n', '\\w', '<CMD>set wrap!<CR>', { desc = 'Toggle line wrap' })

vim.keymap.set('n', '<leader>|', '<CMD>vsplit<CR>', { desc = 'Vertically split Neovim' })
vim.keymap.set('n', '<leader>-', '<CMD>split<CR>', { desc = 'Horizontally split Neovim' })

vim.keymap.set({ 'i', 't', 'c' }, '<M-h>', '<Left>', { desc = 'Move cursor left' })
vim.keymap.set({ 'i', 't' }, '<M-j>', '<Down>', { desc = 'Move cursor down' })
vim.keymap.set({ 'i', 't' }, '<M-k>', '<Up>', { desc = 'Move cursor up' })
vim.keymap.set({ 'i', 't', 'c' }, '<M-l>', '<Right>', { desc = 'Move cursor right' })

vim.keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Down>', '<Cmd>resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Up>', '<Cmd>resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

vim.keymap.set('n', '<leader>ln', '<CMD>Lazy<CR>', { desc = 'Toggle Lazynvim' })
