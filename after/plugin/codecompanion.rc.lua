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
-- vim.env.OPENAI_API_KEY = get_openai_api_key()

require("codecompanion").setup({
	adapters = {
		my_openai = function()
			return require("codecompanion.adapters").extend("openai_compatible", {
				env = {
					url = "https://genai-api.uberinternal.com/v1", -- optional: default value is ollama url http://127.0.0.1:11434
					api_key = get_openai_api_key(), -- optional: if your endpoint is authenticated
					chat_url = "/chat/completions", -- optional: default value, override if different
					models_endpoint = "/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
				},
				headers = {
					["openai-organization"] = "b9477307-de9f-40af-a368-14d0f67479b6",
				},
				schema = {
					model = {
						default = "session-management/calude-35-sonnet-session-management",
					},
					temperature = {
						order = 2,
						mapping = "parameters",
						type = "number",
						optional = true,
						default = 0.8,
						desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
						validate = function(n)
							return n >= 0 and n <= 2, "Must be between 0 and 2"
						end,
					},
					max_completion_tokens = {
						order = 3,
						mapping = "parameters",
						type = "integer",
						optional = true,
						default = nil,
						desc = "An upper bound for the number of tokens that can be generated for a completion.",
						validate = function(n)
							return n > 0, "Must be greater than 0"
						end,
					},
					stop = {
						order = 4,
						mapping = "parameters",
						type = "string",
						optional = true,
						default = nil,
						desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
						validate = function(s)
							return s:len() > 0, "Cannot be an empty string"
						end,
					},
					logit_bias = {
						order = 5,
						mapping = "parameters",
						type = "map",
						optional = true,
						default = nil,
						desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
						subtype_key = {
							type = "integer",
						},
						subtype = {
							type = "integer",
							validate = function(n)
								return n >= -100 and n <= 100, "Must be between -100 and 100"
							end,
						},
					},
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "my_openai",
		},
		inline = {
			adapter = "my_openai",
		},
		cmd = {
			adapter = "my_openai",
		},
	},
})
