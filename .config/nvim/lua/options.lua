vim.o.wrap=false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'n'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Disable swapfiles
vim.opt.swapfile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = {tab = '» ' ,trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true


vim.opt.ts=4 
vim.opt.sts=4 
vim.opt.sw=4 
vim.opt.expandtab=true

vim.opt.completeopt = { "menuone", "noselect", "popup", "noinsert" }

-- Templates

local function load_template(pattern, template_path)
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
    pattern = pattern,
    callback = function()
      -- specific file path
      local file = vim.fn.expand("%")
      -- check if file is empty (0 bytes) or doesn't exist yet (-1)
      if vim.fn.getfsize(file) <= 0 then
        vim.cmd("0r " .. template_path)
      end
    end,
  })
end

load_template("*.cpp", "~/.vim/templates/skeleton.cpp")
load_template("*.html", "~/.vim/templates/skeleton.html")
load_template("*.java", "~/.vim/templates/skeleton.java")

vim.cmd([[
	autocmd filetype cpp nnoremap <F10> :w <bar> exec 'term clear && g++ '.shellescape('%').' -fsanitize=undefined -fno-sanitize-recover -fsanitize=address -Wconversion -Wall -Wextra -O2 -pedantic -o main && ./main'<CR>
	autocmd filetype sh nnoremap <F5> :w <bar> exec 'term clear && bash %'<CR>
	autocmd filetype javascript nnoremap <F5> :w <bar> exec 'term clear && node %'<CR>
	autocmd filetype java nnoremap <F5> :w <bar> exec 'term clear && java %'<CR>
    ":autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp 
    ":autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    ":autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java
]])
