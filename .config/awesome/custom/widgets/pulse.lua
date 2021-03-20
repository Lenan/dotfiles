local lain = require("lain")
local awful = require("awful")
local beautiful = require("beautiful")

local markup = lain.util.markup

-- Pulse volume
local pulse = lain.widget.pulse({
    --togglechannel = "IEC958,3",
    settings = function()
        local header = beautiful.vol_icon
        local v = volume_now.left .. "% "
        if volume_now.muted == "yes" then
            v = v .. " M"
        end
        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.vol_icon_color, header))
            ..
            markup.font(beautiful.font, markup(beautiful.fg_normal, v))
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
