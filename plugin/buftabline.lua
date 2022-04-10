local M = {}

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

local icon_hls = {}

local get_hl_attribute = function(hl, attribute)
	local rgb_val = vim.api.nvim_get_hl_by_name(hl, true)[attribute]
	return rgb_val and string.format('#%06x', rgb_val) or 'NONE'
end

local define_hl = function(name, fg, bg)
	vim.api.nvim_set_hl(0, name, { fg = fg, bg = bg })
	icon_hls[name] = true
end

local function merge_hl(fg_hl, bg_hl)
	local merged = fg_hl .. bg_hl
	if not icon_hls[merged] then
		define_hl(merged, get_hl_attribute(fg_hl, 'foreground'), get_hl_attribute(bg_hl, 'background'))
	end
	return merged
end

local function add_hl(text, hl)
	return string.format('%%#%s#%s%%*', hl, text)
end

function Buftab:generate_icon()
	local icon_pos = self.format:find '#{i}'

	local fname = vim.fn.fnamemodify(self.buf.name, ':t')
	local ext = vim.fn.fnamemodify(self.buf.name, ':e')
	if ext == '' then
		ext = vim.api.nvim_buf_get_option(self.buf.bufnr, 'filetype')
	end

	local icon, icon_hl = require('nvim-web-devicons').get_icon(fname, ext, { default = true })
	self.icon = icon
	self.icon_pos = icon_pos
	self.icon_hl = merge_hl(icon_hl, self.hl)
end

function Buftab:new(buf, index, last)
	local t = {}
	t.index = index
	t.insert_at = index
	t.last = last

	t.buf = buf
	t.name = vim.fn.fnamemodify(buf.name, ':t')
	t.format = ' #{i} #{b}#{f} '
	t.position = 'left'

	setmetatable(t, self)

	t:generate_hl()
	t:generate_flags()
	t:generate_icon()
	return t
end

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
	if not self.icon then
		self.label = add_hl(self.label, self.hl)
		return
	end

	-- assume first space after icon represents icon end
	local icon_end = self.label:find('%s', self.icon_pos)
	if not icon_end then
		self.label = add_hl(self.label, self.hl)
		return
	end

	-- split tab to correctly apply highlights
	local before_icon_part = self.label:sub(1, self.icon_pos - 1)
	local icon_part = self.label:sub(self.icon_pos, icon_end)
	local after_icon_part = self.label:sub(icon_end + 1)

	local highlighted = {
		add_hl(before_icon_part, self.hl),
		add_hl(icon_part, self.icon_hl),
		add_hl(after_icon_part, self.hl),
	}
	self.label = table.concat(highlighted)
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
		local split_path = vim.split(self.buf.name, '/')
		local disambiguated = { split_path[#split_path - 1], '/', name }
		name = table.concat(disambiguated)
	end

	self.label = self.format
	self:replace_template('#{n}', self.index)
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
	return vim.api.nvim_buf_get_option(bufnr, 'buflisted') and vim.api.nvim_buf_get_name(bufnr) ~= ''
end

local getbufinfo = function()
	local current_bufnr = vim.api.nvim_get_current_buf()
	local processed = {}
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if should_handle(bufnr) then
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

local buf_mod = {}

buf_mod.getbufinfo = getbufinfo

buf_mod.make_buftabs = function()
	local bufinfo, buftabs = getbufinfo(), {}
	for i, buf in ipairs(bufinfo) do
		table.insert(buftabs, Buftab:new(buf, i, i == #bufinfo))
	end
	return buftabs
end

local Tabpage = {}
Tabpage.__index = Tabpage

function Tabpage:generate_hl()
	local name = self.current and 'current' or 'normal'
	self.hl = hlgroups['tabpage_' .. name] or hlgroups[name] or hlgroups.normal or ''
end

function Tabpage:new(opts)
	local index, current = opts.index, opts.current

	local t = {}
	t.index = index
	t.insert_at = index
	t.current = current
	t.format = ' #{n} '
	t.position = 'right'

	setmetatable(t, self)

	t:generate_hl()
	return t
end

function Tabpage:get_width()
	return vim.fn.strchars(self.label)
end

function Tabpage:highlight()
	self.label = add_hl(self.label, self.hl)
end

function Tabpage:generate(budget)
	self.label = self.format
	self.label = self.label:gsub('#{n}', self.index)
	local adjusted = budget - self:get_width()

	self:highlight()
	return adjusted, self.label
end

local tab_mod = {}

tab_mod.tabinfo = function()
	local tabnrs = vim.api.nvim_list_tabpages()
	return #tabnrs <= 1 and {} or tabnrs
end

tab_mod.make_tabpage_tabs = function()
	local current_tabnr, tabpage_tabs = vim.api.nvim_get_current_tabpage(), {}
	for i, tabnr in ipairs(tab_mod.tabinfo()) do
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

	local to_string = table.concat(spacing)
	local hl = hlgroups.spacing
	return hl and add_hl(to_string, hl) or to_string
end

function M.setup()
	local budget = vim.o.columns
	local tabs = {}
	vim.list_extend(tabs, tab_mod.make_tabpage_tabs())
	vim.list_extend(tabs, buf_mod.make_buftabs())

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
