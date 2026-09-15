-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		border_size = 1,
		gaps_in = 1,
		gaps_out = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "scrolling",
		resize_on_border = true,
		no_focus_fallback = true,
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,

		dim_inactive = true,
		dim_strength = 0.12,

		shadow = { enabled = false },
		blur = {
			enabled = true,
			passes = 1,
			size = 2,
			brightness = 1.2,
			contrast = 1.15,
		},
	},

	animations = { enabled = false },

	input = {
		kb_layout = "us, ru",
		kb_options = "grp:win_space_toggle, caps:swapescape",
		repeat_rate = 35,
		repeat_delay = 200,
		force_no_accel = true,
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

	cursor = {
		hide_on_key_press = true,
		no_hardware_cursors = 1,
		inactive_timeout = 5,
	},

	ecosystem = {
		enforce_permissions = false,
		no_donation_nag = true,
		no_update_news = true,
	},
})
