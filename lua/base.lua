vim.cmd("autocmd!")

-- go monorepo
vim.env.PATH = vim.env.VIM_PATH or vim.env.PATH

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.background = dark
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- fold
-- vim.opt.foldmethod = "syntax"
-- vim.opt.foldlevel = 1
-- vim.opt.foldclose = "all"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.cpp",
	command = "0r ~/.base.cpp",
})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.py",
	command = "0r ~/.base.py",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "lua vim.lsp.buf.format()",
})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.go",
	callback = function()
		local special_dir = vim.fn.expand("~/Documents/marathon")
		local file_path = vim.fn.expand("%:p")
		print("Inserting base.go for: " .. file_path)

		-- Fixed variable name here (was special_root)
		if file_path:find(special_dir, 1, true) == 1 then
			if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
				-- Insert base template
				vim.cmd("0r ~/.base.go")

				-- Disable GitHub Copilot
				vim.cmd("Copilot disable")

				-- notify you it's been disabled
				vim.notify("Copilot disabled for file: " .. file_path, vim.log.levels.INFO)
			end
		end
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	--buffer = bufnr,
-- 	pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
-- 	command = "EslintFixAll",
-- })
