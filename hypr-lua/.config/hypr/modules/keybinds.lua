local main_mod = "SUPER"

hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd("uwsm app -- ghostty"))
hl.bind(main_mod .. " + ESCAPE", hl.dsp.window.close())
hl.bind(main_mod .. " + F", hl.dsp.exec_cmd("uwsm app -- firefox"))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd("uwsm app -- wofi --show drun"))
hl.bind(main_mod .. " + I", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

-- Switch workspaces with main_mod + [0-9]
-- Move active window to a workspace with main_mod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

-- Move focus with main_mod + arrow keys
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Scroll through existing workspaces with main_mod + scroll
hl.bind(main_mod .. " + code:60", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + code:59", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with main_mod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
