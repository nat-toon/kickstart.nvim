-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 8 -- A TAB character looks like 4 spaces
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.opt.expandtab = true
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
require 'keybinds'
require 'options'

-- [ Install `lazy.nvim` plugin manager ]]
--          See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--          :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--          :Lazy update
--
-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
-- NOTE: Here is where you install your plugins.
-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
-- NOTE: Plugins can specify dependencies.
---@diagnostic disable-next-line: param-type-mismatch
require('lazy').setup("plugins")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
