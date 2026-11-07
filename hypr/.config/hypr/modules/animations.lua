hl.config({
	animations = { enabled = false },
})

local curves = {}
local animations = {}

for _, curve in ipairs(curves) do
	hl.curve(curve)
end

for _, animation in ipairs(animations) do
	hl.animation(animation)
end
