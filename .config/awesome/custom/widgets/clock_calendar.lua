local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local lain = require("lain")

local font = beautiful.font
local markup = lain.util.markup
local accent = beautiful.border_focus
local normal = beautiful.fg_normal


-- Textclock
local widget = {}
widget.textclock = wibox.widget.textclock(
        markup(accent, " ") ..
        markup(normal, "%d %b ") ..
        markup(accent, " ") ..
        markup(normal, "%H:%M ")
)
widget.textclock.font = font

widget.cal = awful.widget.calendar_popup.month(
    {
        margin = dpi(4),
        bg = beautiful.bg_normal,
        style_focus = { fg_color = accent },
        style_month = {
            padding = dpi(10),
            border_color = accent,
            border_width = dpi(4)
        }
    }
)
widget.cal:attach(widget.textclock, 'tr')

return widget
