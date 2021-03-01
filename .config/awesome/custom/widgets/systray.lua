local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local systray = wibox.widget {
            {
                {
                    widget = wibox.widget.systray(),
		    base_size = beautiful.systray_size,
                },
                widget = wibox.container.margin,
		top = dpi(10),
		bottom = dpi(10),
		left = dpi(-10),
		right = dpi(-2),
            },
	    widget=wibox.container.background,
        }

return systray
