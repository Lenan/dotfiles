local awful = require("awful")
local beautiful = require("beautiful")
local tags = beautiful.taglist_icons
awful.screen.connect_for_each_screen(function(s)
    awful.tag(tags, s, awful.layout.layouts[1])
end)

return tags
