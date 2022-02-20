local fb = require('pairs.fallback')
local opts = {
	pairs = {
		['*'] = {
			{ '(', ')' },
			{ '[', ']' },
			{ '{', '}' },
			{ "'", "'" },
			{ '"', '"' },
		},
		lua = {
			{ '(', ')', { ignore = { '%(', '%)', '%%' } } },
			{ '[', ']', { ignore = { '%[', '%]', '%%' } } },
			{ '{', '}', { ignore = { '%{', '%}', '%%' } } },
		},
		python = {
			{ "'", "'", { triplet = true } },
			{ '"', '"', { triplet = true } },
		},
		ruby = {
			{ '|', '|' },
		},
		markdown = {
			{ '`', '`', { triplet = true } },
		},
		tex = {
			{ '$', '$', { cross_line = true } },
			-- Chinese pairs
			{ '（', '）' },
			{ '【', '】' },
			{ '‘', '’' },
			{ '“', '”' },
		},
	},
	default_opts = {
		['*'] = {
			ignore_pre = '\\\\', -- double backslash or [[\\]]
			ignore_after = '\\w', -- double backslash or [[\w]]
		},
		lua = {
			ignore_pre = '[%\\\\]', -- double backslash
		},
	},
	indent = {
		['*'] = 1,
		python = 2,
	},
	delete = {
		enable_mapping = true,
		enable_cond = true,
		enable_fallback = fb.delete,
		empty_line = {
			enable_cond = true,
			enable_fallback = fb.delete,
			bracket_bracket = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_one_indent',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = 'smart',
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
			bracket_text = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_zero_above',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = 'smart',
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
			text_bracket = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_one_cur',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = 'leave_zero_above',
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
			text_text = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_one_above',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = nil,
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
		},
		empty_pre = {
			enable_cond = true,
			enable_fallback = fb.delete,
			bracket_bracket = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_one_indent',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = 'delete_all',
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
			bracket_text = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_zero_below',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = 'leave_zero_below',
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
			text_bracket = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_one_indent',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = 'leave_zero_above',
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
			text_text = {
				fallback = fb.delete_indent,
				multi = {
					strategy = 'leave_one_cur',
					fallback = fb.delete_indent,
				},
				one = {
					strategy = nil,
					trigger_indent_level = 0,
					fallback = fb.delete,
				},
			},
		},
		current_line = {
			enable_cond = true,
			enable_fallback = fb.delete,
		},
	},
	space = {
		enable_mapping = true,
		enable_cond = true,
		enable_fallback = fb.space,
	},
	enter = {
		enable_mapping = true,
		enable_cond = true,
		enable_fallback = fb.enter,
	},
	autojump_strategy = {
		unbalanced = 'right', -- all, right, none
	},
	mapping = {
		jump_left_in_any = '<m-[>',
		jump_right_out_any = '<m-]>',
		jump_left_out_any = '<m-{>',
		jump_right_in_any = '<m-}>',
	},
	max_search_lines = 500,
}

require('pairs'):setup(opts)
