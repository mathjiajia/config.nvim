local M = {}

local dir_separator = vim.fn.fnamemodify(vim.fn.getcwd(), ':p'):sub(-1)
local api = vim.api

local hlgroups = {
	current = 'TabLineSel',
	normal = 'TabLineFill',
	spacing = nil,
	active = nil,
	modified_current = nil,
	modified_normal = nil,
	modified_active = nil,
	tabpage_current = nil,
	tabpage_normal = nil,
}

local Buftab = {}
Buftab.__index = Buftab

-- new buftab methods
function Buftab:generate_hl()
	local name = self.buf.current and 'current' or self.buf.active and 'active' or 'normal'

	self.hl = self.buf.changed and hlgroups['modified_' .. name] or hlgroups[name] or hlgroups.normal or ''
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
	local icon_pos = self.format:find('#{i}')

	local fname = vim.fn.fnamemodify(self.buf.name, ':t')
	local ext = vim.fn.fnamemodify(self.buf.name, ':e')
	if ext == '' then
		ext = vim.api.nvim_buf_get_option(self.buf.bufnr, 'filetype')
	end

	local icon, _ = require('nvim-web-devicons').get_icon(fname, ext, { default = true })
	self.icon = icon
	self.icon_pos = icon_pos
end

function Buftab:new(buf, index, last)
	local r = {}
	r.index = index
	r.insert_at = index
	r.last = last

	r.buf = buf
	r.name = vim.fn.fnamemodify(buf.name, ':t')
	r.format = ' #{i} #{b}#{f} '
	r.position = 'left'

	setmetatable(r, self)

	r:generate_hl()
	r:generate_flags()
	r:generate_icon()
	return r
end

-- generator methods
function Buftab:can_insert(adjusted)
	return self.buf.safe or adjusted > 0
end

function Buftab:get_width()
	return vim.fn.strchars(self.label)
end

function Buftab:truncate(adjusted)
	self.label = vim.fn.strcharpart(self.label, 0, self:get_width() + adjusted - 1) .. '>'
	self.last = true
end

function Buftab:highlight()
	self.label = string.format('%%#%s#%s%%*', self.hl, self.label)
end

function Buftab:is_ambiguous(tabs)
	for _, existing in ipairs(tabs) do
		if existing.name == self.name and existing.buf.name ~= self.buf.name then
			return true
		end
	end
	return false
end

function Buftab:replace_template(option, val)
	local start_pos = self.label:find(option)
	if not start_pos then
		return
	end

	local len_before = #self.label
	self.label = self.label:gsub(option, val)
	if self.icon_pos and start_pos < self.icon_pos then
		self.icon_pos = self.icon_pos + #self.label - len_before
	end
end

function Buftab:generate(budget, tabs)
	local name = self.name
	if self:is_ambiguous(tabs) then
		local split_path = vim.split(self.buf.name, dir_separator)
		local disambiguated = { split_path[#split_path - 1], dir_separator, name }
		name = table.concat(disambiguated)
	end

	self.label = self.format
	self:replace_template('#{f}', self.flags)
	self:replace_template('#{i}', self.icon or '')
	self:replace_template('#{b}', name)

	local adjusted = budget - self:get_width()
	if not self:can_insert(adjusted) then
		self:truncate(adjusted)
	end

	self:highlight()
	return adjusted, self.label, self.last
end

local should_handle = function(bufnr)
	return api.nvim_buf_get_option(bufnr, 'buflisted') and api.nvim_buf_get_name(bufnr) ~= ''
end

local getbufinfo = function()
	local current_bufnr = api.nvim_get_current_buf()
	local processed = {}
	for _, bufnr in ipairs(api.nvim_list_bufs()) do
		if should_handle(bufnr) then
			table.insert(processed, {
				bufnr = bufnr,
				name = api.nvim_buf_get_name(bufnr),
				current = bufnr == current_bufnr,
				safe = bufnr <= current_bufnr,
				changed = api.nvim_buf_get_option(bufnr, 'modified'),
				modifiable = api.nvim_buf_get_option(bufnr, 'modifiable'),
				readonly = api.nvim_buf_get_option(bufnr, 'readonly'),
				active = vim.fn.bufwinnr(bufnr) > 0,
			})
		end
	end
	return processed
end

local b = {}

b.getbufinfo = getbufinfo

b.make_buftabs = function()
	local bufinfo = getbufinfo()
	local buftabs = {}
	for i, buf in ipairs(bufinfo) do
		table.insert(buftabs, Buftab:new(buf, i, i == #bufinfo))
	end
	return buftabs
end

local t = {}

local Tabpage = {}
Tabpage.__index = Tabpage

-- new tabpage methods
function Tabpage:generate_hl()
	local name = self.current and 'current' or 'normal'
	self.hl = hlgroups['tabpage_' .. name] or hlgroups[name] or hlgroups.normal or ''
end

function Tabpage:new(opts)
	local index, current = opts.index, opts.current

	local s = {}
	s.index = index
	s.insert_at = index
	s.current = current
	s.format = ' #{n} '
	s.position = 'right'

	setmetatable(s, self)

	s:generate_hl()
	return s
end

-- generator methods
function Tabpage:get_width()
	return vim.fn.strchars(self.label)
end

function Tabpage:highlight()
	self.label = string.format('%%#%s#%s%%*', self.hl, self.label)
end

function Tabpage:generate(budget)
	self.label = self.format
	self.label = self.label:gsub('#{n}', self.index)
	local adjusted = budget - self:get_width()

	self:highlight()
	return adjusted, self.label
end

t.tabinfo = function()
	local tabnrs = api.nvim_list_tabpages()
	if #tabnrs <= 1 then
		return {}
	end

	return tabnrs
end

t.make_tabpage_tabs = function()
	local current_tabnr = api.nvim_get_current_tabpage()
	local tabpage_tabs = {}
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
	local budget = vim.o.columns
	local tabs = {}
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

vim.o.tabline = [[%!luaeval('tabline.setup()')]]

_G.tabline = M

return M
