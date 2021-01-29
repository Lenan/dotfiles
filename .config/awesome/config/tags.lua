local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type
local awful = require("awful")
local gears = require("gears")


awful.screen.connect_for_each_screen(function(s)
    awful.tag({"1","2","3","4","5"}, s, awful.layout.layouts[1])
end)
