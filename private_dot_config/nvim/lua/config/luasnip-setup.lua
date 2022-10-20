local ls = require('luasnip')
local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
	all = {
		ls.snippet({
			trig = "date",
			namr = "Date",
			dscr = "Date in form of YYYY-MM-DD",
		}, {
			ls.function_node(date, {}),
		}),
	},
})
