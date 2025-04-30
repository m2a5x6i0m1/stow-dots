-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
local start_table = {
	-- DE
	"uwsm app -- hypridle",
	"uwsm app -- hyprsunset -t 3000",
	"uwsm app -- awww-daemon && awww restore",
	"uwsm app -- qs",

	-- Polkit
	"uwsm app -- systemctl --user start hyprpolkitagent",

	-- Clipboard Support
	"uwsm app -- wl-paste --type text --watch cliphist store",
	"uwsm app -- wl-paste --type image --watch cliphist store",

	-- Clipboard History
	"uwsm app -- wl-paste --watch cliphist store",

	-- Clipboard Persistence
	"uwsm app -- wl-clip-persist --clipboard regular",
}

local traverseStartTable = function()
	for _, cmd in ipairs(start_table) do
		hl.exec_cmd(cmd)
	end
end

hl.on("hyprland.start", traverseStartTable)
