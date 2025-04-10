vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local cwd = vim.fn.getcwd()
		local disable_dirs = {
			"/home/Documents/marathon",
		}

		for _, dir in ipairs(disable_dirs) do
			if cwd:find(dir, 1, true) == 1 then
				-- For copilot.lua
				vim.cmd("Copilot disable")
				vim.cmd("C")

				-- Optional: notify or log
				vim.notify("Copilot disabled in " .. cwd, vim.log.levels.INFO)

				break
			end
		end
	end,
})
