set termguicolors
set autochdir

nmap <D-s> :w<cr>
imap <D-s> <Esc>:w<cr>	

" Display
" Line spacing
set linespace=10
" Scale
" let g:neovide_scale_factor = 1.0
" Padding
" let g:neovide_padding_top = 0
" let g:neovide_padding_bottom = 0
" let g:neovide_padding_right = 0
" let g:neovide_padding_left = 0
" Window Blur (Currently macOS only)
let g:neovide_window_blurred = v:true
" Floating Blur Amount
" let g:neovide_floating_blur_amount_x = 2.0
" let g:neovide_floating_blur_amount_y = 2.0
" Floating Shadow
" let g:neovide_floating_shadow = v:true
" let g:neovide_floating_z_height = 10
" let g:neovide_light_angle_degrees = 45
" let g:neovide_light_radius = 5
" Transparency
"let g:neovide_transparency = 0
"let g:transparency = 0.8
"let g:neovide_background_color = '#252623'.printf('%x', float2nr(255 * g:transparency))
" Show Border (Currently macOS only)
let g:neovide_show_border = v:false
" Scroll Animation Length
" let g:neovide_scroll_animation_length = 0.3
" Far scroll lines
" let g:neovide_scroll_animation_far_lines = 1
" Hiding the mouse when typing
" let g:neovide_hide_mouse_when_typing = v:false
" Underline automatic scaling
" let g:neovide_underline_stroke_scale = 1.0
" Theme
let g:neovide_theme = 'dark'
" Fix border and winbar scrolling glitches
" let g:neovide_unlink_border_highlights = v:true

" Functionality
" Refresh Rate
" let g:neovide_refresh_rate = 60
" Idle Refresh Rate
" let g:neovide_refresh_rate_idle = 5
" No Idle
" let g:neovide_no_idle = v:true
" Confirm Quit
let g:neovide_confirm_quit = v:true
" Fullscreen
" let g:neovide_fullscreen = v:true
" Remember Previous Window Size
" let g:neovide_remember_window_size = v:true
" Profiler
" let g:neovide_profiler = v:false

" Input Settings
" macOS Alt is Meta
let g:neovide_input_macos_option_key_is_meta = 'only_left'
" IME
" let g:neovide_input_ime = v:true
" Touch Deadzone
" let g:neovide_touch_deadzone = 6.0
" Touch Drag Timeout
" let g:neovide_touch_drag_timeout = 0.17

" Cursor Settings
" Animation Length
" let g:neovide_scroll_animation_length = 0.13
" Animation Trail Size
" let g:neovide_cursor_trail_size = 0.8
" Antialiasing
" let g:neovide_cursor_antialiasing = v:true
" Animate in insert mode
" let g:neovide_cursor_animate_in_insert_mode = v:true
" Animate switch to command line
" let g:neovide_cursor_animate_command_line = v:true
" Unfocused Outline Width
" let g:neovide_cursor_unfocused_outline_width = 0.125
" Animate cursor blink
" let g:neovide_cursor_smooth_blink = v:false

" Cursor Particles
" railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
let g:neovide_cursor_vfx_mode = "railgun" 

" Particle Settings
" Particle Opacity
" let g:neovide_cursor_vfx_opacity = 200.0
" Particle Lifetime
" let g:neovide_cursor_vfx_particle_lifetime = 1.2
" Particle Density
" let g:neovide_cursor_vfx_particle_density = 7.0
" Particle Speed
" let g:neovide_cursor_vfx_particle_speed = 10.0
" Particle Phase, Only for the railgun vfx mode
" let g:neovide_cursor_vfx_particle_phase = 1.5
" Particle Curl, Only for the railgun vfx mode
" let g:neovide_cursor_animation_length = 0.13
