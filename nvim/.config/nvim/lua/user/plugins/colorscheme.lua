return {
	opts = function()
		return {
			style = "night",
		}
	end,
	config = function(_, opts)
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		tokyonight.load()
	end,
}
