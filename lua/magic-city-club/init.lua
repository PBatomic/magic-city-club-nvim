local M = {}

function M.setup(opts)
	opts = opts or {}
	local p = require("magic-city-club.palette")

	if type(opts.overrides) == "function" then
		opts.overrides(p)
	end

	require("magic-city-club.theme").apply(p)

	if vim.o.termguicolors ~= true then
		vim.o.termguicolors = true
	end

	M.palette = p
end

function M.load()
	require("magic-city-club").setup()
end

return M
