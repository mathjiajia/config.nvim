local M = {}

local hlgroups = {
	current = 'TabLineSel',
	normal = 'TabLineFill',
}

local Buftab = {}
Buftab.__index = Buftab

function Buftab:generate_hl()
	local name = self.buf.current and 'current' or self.buf.active or 'normal'
	self.hl = hlgroups[name] or 'TabLineFill'
end

function Buftab:generate_flags()
	local buffer_flags = {}
	if self.buf.changed then
		table.insert(buffer_flags, ' [+]')
	end
	if not self.buf.modifiable then
		table.insert(buffer_flags, ' [-]')
	end
	if self.buf.readonly then
		table.insert(buffer_flags, ' [RO]')
	end
	if vim.tbl_count(buffer_flags) > 0 then
		table.insert(buffer_flags, 1, '')
	end
	self.flags = table.concat(buffer_flags)
end

function Buftab:generate_icon()
	local fname, ext = vim.fn.fnamemodify(self.buf.name, ':t'), vim.fn.fnamemodify(self.buf.name, ':e')
	if ext == '' then
		ext = vim.api.nvim_buf_get_option(self.buf.bufnr, 'filetype')
	end

	self.icon = require('nvim-web-devicons').get_icon(fname, ext, { default = true })
end

function Buftab:new(buf, index, last)
	local r = {
		index = index,
		insert_at = index,
		last = last,
		buf = buf,
		name = vim.fn.fnamemodify(buf.name, ':t'),
		position = 'left',
	}

	setmetatable(r, self)
	r:generate_hl()
	r:generate_icon()
	r:generate_flags()
	return r
end

-- generator methods
function Buftab:is_ambiguous(tabs)
	for _, existing in ipairs(tabs) do
		if existing.name == self.name and existing.buf.name ~= self.buf.name then
			return true
		end
	end
	return false
end

function Buftab:generate(budget, tabs)
	local name = self.name
	if self:is_ambiguous(tabs) then
		local split_path = vim.split(self.buf.name, '/')
		local disambiguated = { split_path[#split_path - 1], '/', name }
		name = table.concat(disambiguated)
	end

	self.label = ' ' .. self.icon .. ' ' .. name .. self.flags .. ' '

	local adjusted = budget - vim.fn.strchars(self.label)
	if not self.buf.safe and adjusted <= 0 then
		self.label = vim.fn.strcharpart(self.label, 0, vim.fn.strchars(self.label) + adjusted - 1) .. '>'
		self.last = true
	end

	self.label = string.format('%%#%s#%s%%*', self.hl, self.label)
	return adjusted, self.label, self.last
end

local getbufinfo = function()
	local current_bufnr = vim.api.nvim_get_current_buf()
	local processed = {}
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(bufnr, 'buflisted') and vim.api.nvim_buf_get_name(bufnr) ~= '' then
			table.insert(processed, {
				bufnr = bufnr,
				name = vim.api.nvim_buf_get_name(bufnr),
				current = bufnr == current_bufnr,
				safe = bufnr <= current_bufnr,
				changed = vim.api.nvim_buf_get_option(bufnr, 'modified'),
				modifiable = vim.api.nvim_buf_get_option(bufnr, 'modifiable'),
				readonly = vim.api.nvim_buf_get_option(bufnr, 'readonly'),
				active = vim.fn.bufwinnr(bufnr) > 0,
			})
		end
	end
	return processed
end

local b = {}
b.getbufinfo = getbufinfo

b.make_buftabs = function()
	local bufinfo, buftabs = getbufinfo(), {}
	for i, buf in ipairs(bufinfo) do
		table.insert(buftabs, Buftab:new(buf, i, i == #bufinfo))
	end
	return buftabs
end

local t, Tabpage = {}, {}
Tabpage.__index = Tabpage

function Tabpage:generate_hl()
	local name = self.current and 'current' or 'normal'
	self.hl = hlgroups[name] or 'TabLineFill'
end

function Tabpage:new(opts)
	local s = {
		index = opts.index,
		insert_at = opts.index,
		current = opts.current,
		position = 'right',
	}

	setmetatable(s, self)
	s:generate_hl()
	return s
end

-- generator methods
function Tabpage:generate(budget)
	self.label = ' #{n} '
	self.label = self.label:gsub('#{n}', self.index)
	local adjusted = budget - vim.fn.strchars(self.label)

	self.label = string.format('%%#%s#%s%%*', self.hl, self.label)
	return adjusted, self.label
end

t.tabinfo = function()
	local tabnrs = vim.api.nvim_list_tabpages()
	if #tabnrs <= 1 then
		return {}
	end

	return tabnrs
end

t.make_tabpage_tabs = function()
	local current_tabnr, tabpage_tabs = vim.api.nvim_get_current_tabpage(), {}
	for i, tabnr in ipairs(t.tabinfo()) do
		table.insert(
			tabpage_tabs,
			Tabpage:new {
				index = i,
				current = tabnr == current_tabnr,
			}
		)
	end
	return tabpage_tabs
end

local make_separator = function(budget)
	local spacing = {}
	for _ = 1, budget do
		table.insert(spacing, ' ')
	end

	return table.concat(spacing)
end

function M.setup()
	local budget, tabs = vim.o.columns, {}
	vim.list_extend(tabs, t.make_tabpage_tabs())
	vim.list_extend(tabs, b.make_buftabs())

	local labels, insert_separator_at = {}, 0
	for _, tab in ipairs(tabs) do
		local remaining, label, last = tab:generate(budget, tabs)
		budget = remaining

		if tab.position == 'right' or tabs[1].position == 'left' then
			table.insert(labels, label)
		else
			table.insert(labels, tab.insert_at, label)
		end

		if last then
			insert_separator_at = tab.insert_at
			break
		end
	end

	local separator = make_separator(budget)
	if tabs[1] and tabs[1].position == 'right' then
		table.insert(labels, insert_separator_at + 1, separator)
	else
		table.insert(labels, separator)
	end

	return table.concat(labels)
end

vim.opt.showtabline = 2
vim.o.tabline = '%!v:lua.tabline.setup()'
_G.tabline = M

return M
