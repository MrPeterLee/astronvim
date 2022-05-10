local cmp_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")
if not cmp_ok or not luasnip_ok then
	return {}
end

return {

	-- Key mappings
	mapping = {
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Use <C-f> to complete copilot
		["<C-f>"] = cmp.mapping(function(fallback)
			cmp.mapping.abort()
			local copilot_keys = vim.fn["copilot#Accept"]()
			if copilot_keys ~= "" and type(copilot_keys) == "string" then
				vim.api.nvim_feedkeys(copilot_keys, "i", true)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			-- local copilot_keys = vim.fn["copilot#Accept"]()
			-- if copilot_keys ~= "" and type(copilot_keys) == "string" then
			-- vim.api.nvim_feedkeys(copilot_keys, "i", true)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
}
