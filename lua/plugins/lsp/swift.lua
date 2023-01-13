local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
	name = "swift_format",
	meta = {
		url = "https://github.com/apple/swift-format",
		description = "Formatting technology for Swift source code.",
	},
	method = FORMATTING,
	filetypes = { "swift" },
	generator_opts = {
		command = "swift-format",
		args = {
			"format",
			"$FILENAME",
		},
		to_stdin = true,
	},
	factory = h.formatter_factory,
})
