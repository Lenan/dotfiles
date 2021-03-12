local awful         = require("awful")
require("awful.autofocus")
local beautiful     = require("beautiful")

-- autostart desired programs
awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- Second screen was focused after startup. This sets it to the first(left) monitor
-- awful.screen.focus(awful.screen.getbycoord(0,0))

require("custom.errorhandling")

local themes = {
    "variety",          -- 1
    "horizon",          -- 2
    "rpg", 		        -- 3
    "kanji",            -- 4
}

local chosen_theme = themes[3]

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

require("custom.wallpaper")
require("custom.rules")
require("custom.layouts")
require("custom.tags")
require("custom.signals")
require("custom.keys")
require("custom.wibar")
