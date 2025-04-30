-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		layout = "scrolling",
		resize_on_border = true,
		no_focus_fallback = true,
	},

	misc = {
		disable_autoreload = true,
		disable_splash_rendering = true,
		disable_xdg_env_checks = true,
		key_press_enables_dpms = true,
	},

	binds = {
		disable_keybind_grabbing = true,
		movefocus_cycles_fullscreen = true,
		workspace_center_on = 1,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	ecosystem = {
		enforce_permissions = false,
		no_donation_nag = true,
		no_update_news = true,
	},
})
