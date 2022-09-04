set guifont=JetBrainsMono\ Nerd\ Font:h26

if exists('g:neovide')
	let g:neovide_input_macos_alt_is_meta=v:true
	let g:neovide_background_color='#1D2021'

	let g:neovide_cursor_vfx_mode='railgun'
	let g:neovide_cursor_vfx_opacity=200.0
	let g:neovide_cursor_vfx_particle_lifetime=1.2
	let g:neovide_cursor_vfx_particle_density=7.0
	let g:neovide_cursor_vfx_particle_speed=10.0

    nnoremap <silent> <D-q> <Cmd>wq<CR>
    nnoremap <silent> <D-s> <Cmd>write<CR>
    inoremap <silent> <D-s> <Esc><Cmd>write<CR>
endif
