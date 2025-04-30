local main_mod = "SUPER"

local binds_table = {
	{ "code:60", hl.dsp.focus({ workspace = "e+1" }) },
	{ "code:59", hl.dsp.focus({ workspace = "e-1" }) },

	{ "h", hl.dsp.focus({ direction = "left" }) },
	{ "j", hl.dsp.focus({ direction = "down" }) },
	{ "k", hl.dsp.focus({ direction = "up" }) },
	{ "l", hl.dsp.focus({ direction = "right" }) },

	{ "ESCAPE", hl.dsp.window.close() },

	{ "U", hl.dsp.window.fullscreen() },
	{ "I", hl.dsp.window.float() },
	{ "O", "wofi --show drun" },
	{ "P", "cliphist list | wofi --dmenu | cliphist decode | wl-copy" },

	{ "RETURN", "uwsm app -- ghostty" },
	{ "F", "uwsm app -- firefox" },
}

local applyBinds = function(binds)
	for _, bind in ipairs(binds) do
		if type(bind[2]) == "string" then
			hl.bind(main_mod .. " + " .. bind[1], hl.dsp.exec_cmd(bind[2]))
		elseif type(bind[2]) == "userdata" then
			hl.bind(main_mod .. " + " .. bind[1], bind[2])
		end
	end
end

applyBinds(binds_table)

-- Power Menu
hl.bind(main_mod .. " + SHIFT + BACKSPACE", hl.dsp.exec_cmd("~/.config/hypr/_refactor/scripts/power-menu.sh"))

-- Move/resize windows with main_mod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with main_mod + [0-9]
-- Move active window to a workspace with main_mod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Laptop multimedia keys for volume and LCD brightness
local args = { locked = true, repeating = true }

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 10%+"), args)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 10%-"), args)

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), args)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), args)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"), args)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), args)
