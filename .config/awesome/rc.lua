-- {{{ Required libraries
local awful         = require("awful")
require("awful.autofocus")
local gears = require("gears")
local beautiful     = require("beautiful")
-- }}}

require("config.errorhandling")

local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "variety",         -- 10
    "vertex",          -- 11
    "horizon",         -- 12
}

local chosen_theme = themes[10]

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

require("config.wallpaper")
require("config.rules")
require("config.tags")
require("config.signals")
require("config.keys")


-- Second screen was focused after startup. This sets it to the first(left) monitor
awful.screen.focus(awful.screen.getbycoord(0,0))

awful.spawn.with_shell("~/.config/awesome/autostart.sh")
