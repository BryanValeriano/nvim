local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'es', ':split<Return><C-w>w')
keymap.set('n', 'ev', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'eh', '<C-w>h')
keymap.set('', 'ek', '<C-w>k')
keymap.set('', 'ej', '<C-w>j')
keymap.set('', 'el', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- NvimTree
keymap.set('n', '<C-n>', '<cmd>:NvimTreeToggle<CR>',{noremap=true})

-- Harpoon
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
vim.keymap.set("n", "<Space>a", mark.add_file)
vim.keymap.set("n", "<Space>o", ui.toggle_quick_menu)

vim.keymap.set("n", "<Space>h", function() ui.nav_file(1) end)
vim.keymap.set("n", "<Space>j", function() ui.nav_file(2) end)
vim.keymap.set("n", "<Space>k", function() ui.nav_file(3) end)
vim.keymap.set("n", "<Space>l", function() ui.nav_file(4) end)
