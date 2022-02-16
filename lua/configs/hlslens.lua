require('hlslens').setup {
	auto_enable = true, --Enable nvim-hlslens automatically
	enable_incsearch = true, --When `incsearch` option is on and enable_incsearch is true, add lens for the current matched instance
	calm_down = false, -- When the cursor is out of the position range of the matched instance and calm_down is true, clear all lens
	nearest_only = false, -- Only add lens for the nearest matched instance and ignore others
	nearest_float_when = 'auto', -- When to open the floating window for the nearest lens.
  -- 'auto': floating window will be opened if room isn't enough for virtual text;
  -- 'always': always use floating window instead of virtual text;
  -- 'never': never use floating window for the nearest lens
	float_shadow_blend = 50, -- Winblend of the nearest floating window.
  -- `:h winbl` for more details
	virt_priority = 100, -- Priority of virtual text, set it lower to overlay others.
	-- `:h nvim_buf_set_extmark` for more details
	build_position_cb = nil, -- A callback function after position list is built,
	-- if `changedtick` or `pattern` is changed, position list will be rebuild and fire this callback.
	-- @param plist (table) {start_pos = {}, end_pos = {}} (1,1)-indexed position
	-- @param bufnr (number) buffer number
	-- @param changedtick (number) `h b:changedtick`
	-- @param pattern (string) search pattern
	override_lens = nil, -- Hackable function for customizing the lens. If you like hacking, you
	-- should search `override_lens` and inspect the corresponding source code.
	-- There's no guarantee that this function will not be changed in the future.
  -- If it is changed, it will be listed in the CHANGES file.
	-- @param bufnr (number) buffer number
	-- @param splist (table) (1,1)-indexed position
	-- @param nearest (boolean) whether nearest lens
	-- @param idx (number) nearest index in the plist
	-- @param r_idx (number) relative index, negative means before current position, positive means after
}
