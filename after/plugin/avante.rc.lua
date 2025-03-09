require("avante").setup({
	provider = "claude",
	openai = {
		model = "gpt-4o", -- or whichever model you desire
		timeout = 30000, -- in milliseconds
		max_tokens = 4096,
		-- reasoning_effort = "high"  -- only supported for certain OpenAI models
	},
	claude = {
		endpoint = "https://api.anthropic.com",
		model = "claude-3-5-haiku-20241022",
		max_tokens = 4096,
	},
})
