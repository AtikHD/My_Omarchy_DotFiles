-- ============================================================
-- PERSONAL KEYBINDS
-- Omarchy
-- ============================================================

local mainMod = "SUPER"

-- ============================================================
-- Applications
-- ============================================================

o.bind(mainMod .. " + Q", "Open Terminal", { omarchy = "terminal" })

o.bind(mainMod .. " + C", "Kill active window", hl.dsp.window.close())

o.bind(mainMod .. " + M", "Exit Hyprland", "hyprctl dispatch exit")

hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd("nautilus"),
    { description = "Open File Manager" }
)

o.bind(
	mainMod .. " + V",
	"Toggle Floating",
	hl.dsp.window.float({ action = "toggle" })
)

o.bind(mainMod .. " + R", "Application Launcher", "rofi -show drun")
-- SUPER+F is already used by Omarchy, so override it
hl.unbind("SUPER + F")

o.bind(
	mainMod .. " + F",
	"Open Firefox Nightly",
	os.getenv("HOME") .. "/.local/firefox-nightly/firefox/firefox"
)-- ============================================================
-- Workspaces
-- ============================================================

for i = 1, 10 do
	local key = i % 10

	o.bind(
		mainMod .. " + " .. key,
		"Workspace " .. i,
		hl.dsp.focus({ workspace = i })
	)

	o.bind(
		mainMod .. " + SHIFT + " .. key,
		"Move window to workspace " .. i,
		hl.dsp.window.move({ workspace = i })
	)
end

-- ============================================================
-- Window controls
-- ============================================================

o.bind(
	mainMod .. " + LEFT",
	"Focus left",
	hl.dsp.focus({ direction = "left" })
)

o.bind(
	mainMod .. " + RIGHT",
	"Focus right",
	hl.dsp.focus({ direction = "right" })
)

o.bind(
	mainMod .. " + UP",
	"Focus up",
	hl.dsp.focus({ direction = "up" })
)

o.bind(
	mainMod .. " + DOWN",
	"Focus down",
	hl.dsp.focus({ direction = "down" })
)

-- Move windows

o.bind(
	mainMod .. " + SHIFT + LEFT",
	"Move window left",
	hl.dsp.window.move({ direction = "l" })
)

o.bind(
	mainMod .. " + SHIFT + RIGHT",
	"Move window right",
	hl.dsp.window.move({ direction = "r" })
)

o.bind(
	mainMod .. " + SHIFT + UP",
	"Move window up",
	hl.dsp.window.move({ direction = "u" })
)

o.bind(
	mainMod .. " + SHIFT + DOWN",
	"Move window down",
	hl.dsp.window.move({ direction = "d" })
)

-- Fullscreen

o.bind(
	mainMod .. " + Z",
	"Toggle Fullscreen",
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "toggle",
	})
)

-- ============================================================
-- Personal applications
-- ============================================================

o.bind(
	mainMod .. " + B",
	"Start Avro",
	"pkill ibus-daemon || (ibus-daemon -drx && sleep 1 && ibus engine avro)"
)

o.bind(
	mainMod .. " + X",
	"Random Wallpaper",
	"waypaper --random"
)

o.bind(
	mainMod .. " + S",
	"Open Spotify",
	"spotify-launcher"
)

o.bind(
	mainMod .. " + A",
	"Toggle Hyprwave",
	"pkill hyprwave || hyprwave"
)

o.bind(
	mainMod .. " + P",
	"Area Screenshot",
	"grimblast copy area"
)

-- ============================================================
-- Mouse controls
-- ============================================================

o.bind(
	mainMod .. " + mouse:272",
	"Move window",
	hl.dsp.window.drag(),
	{ mouse = true }
)

o.bind(
	mainMod .. " + mouse:273",
	"Resize window",
	hl.dsp.window.resize(),
	{ mouse = true }
)

-- ============================================================
-- Window / layout extras
-- ============================================================

o.bind(
	mainMod .. " + G",
	"Toggle Group",
	hl.dsp.group.toggle()
)

o.bind(
	mainMod .. " + K",
	"Swap Split Layout",
	hl.dsp.layout("swapsplit")
)

o.bind(
	mainMod .. " + ALT + LEFT",
	"Swap left",
	hl.dsp.window.swap({ direction = "l" })
)

o.bind(
	mainMod .. " + ALT + RIGHT",
	"Swap right",
	hl.dsp.window.swap({ direction = "r" })
)

o.bind(
	mainMod .. " + ALT + UP",
	"Swap up",
	hl.dsp.window.swap({ direction = "u" })
)

o.bind(
	mainMod .. " + ALT + DOWN",
	"Swap down",
	hl.dsp.window.swap({ direction = "d" })
)

-- ============================================================
-- System actions
-- ============================================================

o.bind(
	mainMod .. " + CTRL + R",
	"Reload Hyprland",
	"hyprctl reload"
)

o.bind(
	mainMod .. " + CTRL + L",
	"Lock Screen",
	"omarchy-system-lock"
)

-- ============================================================
-- Workspace scrolling
-- ============================================================

o.bind(
	mainMod .. " + mouse_down",
	"Next workspace",
	hl.dsp.focus({ workspace = "e+1" })
)

o.bind(
	mainMod .. " + mouse_up",
	"Previous workspace",
	hl.dsp.focus({ workspace = "e-1" })
)

-- ============================================================
-- Multimedia
-- ============================================================

o.bind(
	"XF86AudioRaiseVolume",
	"Volume Up",
	"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
	{ locked = true, repeating = true }
)

o.bind(
	"XF86AudioLowerVolume",
	"Volume Down",
	"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
	{ locked = true, repeating = true }
)

o.bind(
	"XF86AudioMute",
	"Mute",
	"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
	{ locked = true, repeating = true }
)

o.bind(
	"XF86AudioMicMute",
	"Mute Microphone",
	"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
	{ locked = true, repeating = true }
)

o.bind(
	"XF86MonBrightnessUp",
	"Brightness Up",
	"brightnessctl -e4 -n2 set 5%+",
	{ locked = true, repeating = true }
)

o.bind(
	"XF86MonBrightnessDown",
	"Brightness Down",
	"brightnessctl -e4 -n2 set 5%-",
	{ locked = true, repeating = true }
)

o.bind(
	"XF86AudioNext",
	"Next Track",
	"playerctl next"
)

o.bind(
	"XF86AudioPrev",
	"Previous Track",
	"playerctl previous"
)

o.bind(
	"XF86AudioPlay",
	"Play/Pause",
	"playerctl play-pause"
)

o.bind(
	"XF86AudioPause",
	"Play/Pause",
	"playerctl play-pause"
)
