local cmd = vim.cmd

local util = require("utils")

local lazypath = util.join_paths(util.plugin_dir, "/lazy.nvim")
local lazyurl = "https://github.com/folke/lazy.nvim.git"
local lazy_clone_cmd = { "git", "clone", "--filter=blob:none", lazyurl, "--branch=stable", lazypath }
util.clone_plugin(lazypath, lazyurl, lazy_clone_cmd)
vim.opt.rtp:prepend(lazypath)

local plugin_list = {
    {
        "smoka7/hop.nvim",
        event = { "VimEnter" },
        version = "*",
        opts = {},
        config = function()
            require("PluginConfig/hop")
        end,
    }
}
require("lazy").setup(plugin_list, {
    root = util.plugin_dir,
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    lockfile = util.join_paths(vim.fn.stdpath("config"), "lazy-lock.json"),
    })