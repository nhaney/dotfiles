-- Use the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- If on WSL, use windows tools to yank to windows clipboard onto the host.
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

-- Set the line number column to show relative and the current line number.
vim.opt.nu = true
vim.opt.relativenumber = true

-- Default tab to 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Turn off text wrapping.
vim.opt.wrap = false

-- Keep undo history forever.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Don't keep things highlighted during searching.
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Better colors in the terminal.
vim.opt.termguicolors = true

-- Make sure there are at least 8 lines at the bottom.
vim.opt.scrolloff = 8

-- Show the sign column for things like diagnostics, etc.
vim.opt.signcolumn = "yes"

-- Increase vim update time to be more responsive.
vim.opt.updatetime = 50

-- Set column guide line for column 80 and 100.
vim.opt.colorcolumn = "80,100"

-- Case insensitive searching. Smartcase will do case insensitive if an uppercase is in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Turn off virtual text for diagnostics.
vim.diagnostic.config({ virtual_text = false })
