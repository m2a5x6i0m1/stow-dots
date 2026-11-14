local curves = {
	-- Overshoot
	{ "heavyOvershoot", { type = "bezier", points = { { 0.53, 0.51 }, { 0.4, 1.22 } } } },

	-- Linear
	{ "smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } } },

	-- Springs
	{ "hardSpring", { type = "spring", mass = 1, stiffness = 500, dampening = 36 } },
	{ "heavierSpring", { type = "spring", mass = 1.3, stiffness = 480, dampening = 47 } },
}

local animations = {
	{ leaf = "workspaces", enabled = true, speed = 1, spring = "hardSpring", style = "slidevert" },
	{ leaf = "windows", enabled = true, speed = 1, spring = "heavierSpring", style = "popin 80%" },
	{ leaf = "windowsOut", enabled = true, speed = 2, bezier = "heavyOvershoot", style = "popin 30%" },
	{ leaf = "fade", enabled = true, speed = 2, bezier = "smoothIn" },
}

for _, curve in ipairs(curves) do
	hl.curve(curve[1], curve[2])
end

for _, animation in ipairs(animations) do
	hl.animation(animation)
end
