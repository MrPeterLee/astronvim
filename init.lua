-- Scripts must be loaded before plugins are loaded
vim.cmd("source " .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/vimscript/init_first.vim")

local config = {

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	-- options = {
	-- opt = {
	-- 	relativenumber = true, -- sets vim.opt.relativenumber
	-- },
	-- g = {
	-- 	mapleader = " ", -- sets vim.g.mapleader
	-- },
	-- },
}

return config
