local snips = {}

local context = require("util.context")

snips = {
	s({ trig = "fix", name = "FIX", dscr = "FIX:" }, {
		c(1, {
			t("FIX: "),
			t("FIXME: "),
			t("BUG: "),
			t("FIXIT: "),
			t("ISSUE: "),
		}),
	}, { condition = context.in_comments, show_condition = context.in_comments }),

	s(
		{ trig = "todo", name = "TODO", dscr = "TODO:" },
		{ t("TODO: ") },
		{ condition = context.in_comments, show_condition = context.in_comments }
	),

	s(
		{ trig = "hack", name = "HACK", dscr = "HACK:" },
		{ t("HACK: ") },
		{ condition = context.in_comments, show_condition = context.in_comments }
	),

	s({ trig = "warn", name = "WARN", dscr = "WARN:" }, {
		c(1, {
			t("WARN: "),
			t("WARNING: "),
			t("XXX: "),
		}),
	}, { condition = context.in_comments, show_condition = context.in_comments }),

	s({ trig = "perf", name = "PERF", dscr = "PERF:" }, {
		c(1, {
			t("PERF: "),
			t("OPTIM: "),
			t("PERFORMANCE: "),
			t("OPTIMIZE: "),
		}),
	}, { condition = context.in_comments, show_condition = context.in_comments }),

	s({ trig = "note", name = "NOTE", dscr = "NOTE:" }, {
		c(1, {
			t("NOTE: "),
			t("INFO: "),
		}),
	}, { condition = context.in_comments, show_condition = context.in_comments }),

	s({ trig = "test", name = "TEST", dscr = "TEST:" }, {
		c(1, {
			t("TEST: "),
			t("TESTING: "),
			t("PASSED: "),
			t("FAILED: "),
		}),
	}, { condition = context.in_comments, show_condition = context.in_comments }),
}

return snips
