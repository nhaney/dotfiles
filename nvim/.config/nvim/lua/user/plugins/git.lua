return {
	config = function()
		-- TODO: Figure out how to only set if we are in a git repo.
		-- Setup custom keymap for interacting with git.
		require("gitsigns").setup()
		vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
	end,
}
