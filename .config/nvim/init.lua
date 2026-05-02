-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true


-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

local hardmode = true
if hardmode then
    -- Show an error message if a disabled key is pressed
    local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

    -- Disable arrow keys in insert mode with a styled message
    --vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
    --vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
    --vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
    --vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })
    --vim.api.nvim_set_keymap('i', '<Del>', '<C-o>' .. msg, { noremap = true, silent = false })
    --vim.api.nvim_set_keymap('i', '<BS>', '<C-o>' .. msg, { noremap = true, silent = false })
    -- Disable arrow keys in normal mode with a styled message
    vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })


    --vim.api.nvim_set_keymap('n', '<BS>', msg, { noremap = true, silent = false })
end

