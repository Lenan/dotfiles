local lain = require("lain")
local awful = require("awful")
local beautiful = require("beautiful")

local markup = lain.util.markup

-- Pulse volume
local pulse = lain.widget.pulse({
    --togglechannel = "IEC958,3",
    settings = function()
        header = beautiful.vol_icon
        vlevel = volume_now.left .. "% "
        if volume_now.muted == "yes" then
            vlevel = vlevel .. " M"
        end
        widget:set_markup(
		markup.font(beautiful.icon_font, markup(beautiful.icon_accent, header))
		..
		markup.font(beautiful.font, markup(beautiful.fg_normal, vlevel))
	)
    end
})
pulse.widget:buttons(
    awful.util.table.join(
        awful.button({}, 1, function () -- left click)
        awful.spawn("pavucontrol &")
        end)
    )
)

return pulse
