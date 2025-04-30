hl.config({
	general = {
		border_size = 1,
		gaps_in = 1,
		gaps_out = 2,

		col = {
			active_border = "rgb(585b70)",
			inactive_border = "rgb(313244)",
		},
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
			size = 3,
			brightness = 0.8,
			contrast = 2,
			vibrancy = 0.2,
			vibrancy_darkness = 0.2,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		background_color = "rgb(000000)",
	},
})
