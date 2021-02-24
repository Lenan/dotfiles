local awful = require("awful")
local gears = require("gears")
--local tags = {"","","爵",""} -- Taglist with Nerd patched fonts
local tags = {"","", "", ""} -- Taglist with Font Awesome 5 Free
awful.screen.connect_for_each_screen(function(s)
    awful.tag(tags, s, awful.layout.layouts[1])
end)

return tags
