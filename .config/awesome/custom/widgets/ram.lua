local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local apps = require("custom.apps")

local markup = lain.util.markup

local mem = lain.widget.mem({
    settings = function()
        local header = beautiful.ram_icon
        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.icon_accent, header))
            ..
            markup.font(beautiful.font, markup(beautiful.fg_normal," ".. mem_now.used .. "MB"))
        )
    end
})
mem.widget:buttons(
    awful.util.table.join(
        awful.button({}, 1, function() --left click
                awful.spawn(apps.terminal .." -e " .. apps.sysmonitor)
        end)
    )
)

return mem
