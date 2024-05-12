---- HELPERS ----
local g = vim.g -- a table to access global variables


-- lazy.nvim
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

---- Loading Plugins ----
require("plugins")


-- local plugins = {  
-- 	{
-- 		"smoka7/hop.nvim",
-- 		event = { "VimEnter" },
-- 		version = "*",
-- 		opts = {},
-- 		config = function()
-- 			require("plugins hop")
-- 		end,
-- 	},
-- }

-- require("lazy").setup(plugins, opts)




-- https://qiita.com/fufu44/items/6dd78bb3cb8f05cf7f6b



if vim.g.vscode then
	vim.keymap.set("n", "<C-a>", ":normal! ggVG<CR>", { noremap = true, silent = true }) -- ctrl+aで全選択
	vim.keymap.set('v', '<C-c>', '"*y', { noremap = true, silent = true })            -- vscodeだと機能しない
	
	local opt = vim.opt
	opt.clipboard = 'unnamedplus' -- yankでクリップボードに
	-- opt.clipboard = 'unnamed' -- yankでクリップボードに
	vim.keymap.set('n', '<C-j>', 'J',{noremap = true})
	vim.keymap.set('n', '<C-k>', 'K',{noremap = true})
	vim.keymap.set('n', 'J', '10j',{noremap = true})
	vim.keymap.set('n', 'K', '10k',{noremap = true})
	vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})
	vim.api.nvim_set_keymap('i', 'っj', '<ESC>', {silent=true})
else
	-- original
end

-- hop.nvim 
-- place this in one of your configuration file(s)
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, {remap=true})
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true}) 







-- require("lazy").setup("plugins", {
--   performance = {
--     rtp = {
--       disabled_plugins = {
--         "netrw",
--         "netrwPlugin",
--         "netrwSettings",
--         "netrwFileHandlers",
--       },
--     },
--   },
-- }) 