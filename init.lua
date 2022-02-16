local modules = {
	'options',
	'plugins',
	'keybinds',
	'autocmds',
}

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(('Error loading %s...\n\n%s'):format(mod, err))
	end
end
