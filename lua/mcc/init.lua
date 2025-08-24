local M = {}

function M.setup(opts)
	opts = opts or {}
	local p = require("mcc.palette")

	-- Allow runtime overrides: require('mytheme').setup{ overrides = function(p) p.fg = '#ffffff' end }
	if type(opts.overrides) == "function" then
		opts.overrides(p)
	end

	-- Apply theme
	require("mcc.theme").apply(p)

	-- Respect termguicolors
	if vim.o.termguicolors ~= true then
		vim.o.termguicolors = true
	end

	-- Expose palette if users want to query it
	M.palette = p
end

-- :colorscheme hook will call this file in /colors (see below)
function M.load()
	require("mcc").setup()
end

return M
