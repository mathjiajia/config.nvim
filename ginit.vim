set termguicolors
set guifont=JetBrainsMono\ Nerd\ Font:h24

if exists("g:neovide")
	" colorscheme bamboo_nt
	cd $HOME
	autocmd BufEnter * silent! lcd %:p:h

	" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	" let g:neovide_transparency = 0.2
	" let g:transparency = 0.8
	let g:neovide_background_color = '#252326'

	" let g:neovide_window_blurred = v:true
	" let g:neovide_floating_blur_amount_x = 2.0
	" let g:neovide_floating_blur_amount_y = 2.0

	let g:neovide_scroll_animation_length = 0.3

	let g:neovide_input_macos_alt_is_meta = v:true

	nmap <D-s> :w<cr>
	imap <D-s> <Esc>:w<cr>
endif
