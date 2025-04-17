local function get_openai_api_key()
	local handle = io.popen([[usso -ussh genai-api -print "$@" 2>&1 | awk '/eyJ/ {print $NF}' | head -n 1]])
	if handle then
		local result = handle:read("*a")
		handle:close()
		-- Trim whitespace
		return result:gsub("^%s+", ""):gsub("%s+$", "")
	end
	return nil
end
vim.env.OPENAI_API_KEY = get_openai_api_key()

local allowed_patterns = {
	"^src/code%.uber%.internal/identity/",
	"^src/code%.uber%.internal/infra/envoy.*/",
	"^src/code%.uber%.internal/engsec/",
	"^src/code%.uber%.internal/e2e/",
	"^idl/code%.uber%.internal/identity/",
	"^config/infra/",
}

require("avante").setup({
	provider = "openai",
	ignore_file = ".avanteconfig",
	openai = {
		endpoint = "https://genai-api.uberinternal.com/v1",
		model = "session-management/calude-35-sonnet-session-management",
		headers = {
			["openai-organization"] = "b9477307-de9f-40af-a368-14d0f67479b6",
		},
		-- model = "gpt-4o", -- or whichever model you desire
		-- timeout = 30000, -- in milliseconds
		-- max_tokens = 4096,
		-- reasoning_effort = "high"  -- only supported for certain OpenAI models
	},
	claude = {
		endpoint = "https://api.anthropic.com",
		model = "claude-3-5-haiku-20241022",
		max_tokens = 4096,
	},
	context_filter = function(file_path)
		for _, pattern in ipairs(allowed_patterns) do
			if file_path:match(pattern) then
				return true
			end
		end
		return false -- ignore everything else
	end,
})
