return {
	opts = {
		ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "help", "vim" },
		auto_install = true,
		highlight = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
