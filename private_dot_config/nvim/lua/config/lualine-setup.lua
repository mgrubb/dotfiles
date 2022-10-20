local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require('lualine').setup({
	options = {
		theme = 'auto',
		icons_enabled = true,
		disabled_filetypes = {},
		always_divide_middle = false,
	},
	sections = {
		lualine_a = { {"b:gitsigns_head", icon = "" }, { "diff", soruce = diff_source } },
		lualine_b = {
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn', 'info', 'hint' },
			},
		},
		lualine_c = {
			{
				'filetype',
				icon_only = true,
			},
			{
				'filename',
				file_status = true,
				path = 1,
				shorting_target = 40,
				symbols = { modified = "[]", readonly = " " },
			},
		},
		lualine_x = {
			'encoding',
			'fileformat',
			'filesize',
		},
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { 'nvim-tree', 'toggleterm', 'quickfix', 'symbols-outline' },
})
