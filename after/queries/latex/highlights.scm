((generic_command
	command: (command_name) @function
	arg: (curly_group
		(text) @parameter))
	(#eq? @function "\\author")
	(#set! conceal "")
)

((generic_command
	command: (command_name) @function
	arg: (curly_group
		(text) @text.title))
	(#eq? @function "\\title")
	(#set! conceal "")
)

((generic_command
	command: (command_name) @function
	arg: (curly_group
		(text) @parameter))
 (#eq? @function "\\address")
 (#set! conceal "")
)

((generic_command
	command: (command_name) @function.macro)
	(#match? @function.macro "\\DeclarePairedDelimiter")
	; (#set! conceal "")
)

((generic_command
	command: (command_name) @function.macro
	arg: (curly_group
		(text) @text)
	arg: (curly_group
		(text) @text.environment.name))
	(#eq? @function.macro "\\newtheorem*")
)

((generic_command
	command: (command_name) @function)
	(#eq? @function "\\email")
	(#set! conceal "")
)

((generic_command
	command: (command_name) @function)
	(#eq? @function "\\subjclass")
	(#set! conceal "")
)

((generic_command
	command: (command_name) @function
	arg: (curly_group
		(text) @keywords))
	(#eq? @function "\\keywords")
	(#set! conceal "")
)

