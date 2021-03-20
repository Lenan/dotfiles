local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local lain = require("lain")

local markup = lain.util.markup

-- Textclock
local widget = {}
widget.textclock = wibox.widget.textclock(
      markup.font(beautiful.icon_font, markup(beautiful.cal_icon_color, beautiful.cal_icon )) ..
      markup.font(beautiful.font, markup(beautiful.fg_normal, " %d %b "))..
      markup.font(beautiful.icon_font, markup(beautiful.cal_icon_color, beautiful.clock_icon )) ..
      markup.font(beautiful.font, markup(beautiful.fg_normal, " %H:%M"))
)

widget.cal = awful.widget.calendar_popup.month(
    {
        margin = dpi(4),
        bg = beautiful.fg_focus,
        style_focus = {
            fg_color = beautiful.fg_normal,
            bg_color = beautiful.fg_focus
        },
        style_month = {
            padding = dpi(10),
            bg = beautiful.fg_focus,
            border_color = beautiful.fg_focus,
            border_width = dpi(2)
        }
    }
)
-- Uncomment next line if you want a popup calendar when hovering the time/date widget
-- widget.cal:attach(widget.textclock, 'tr')

return widget.textclock
