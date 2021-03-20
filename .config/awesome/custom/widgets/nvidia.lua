local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local apps = require("custom.apps")

local markup = lain.util.markup

local gpu = awful.widget.watch(
    'bash -c "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader | tr -d [:blank:]"',
    1,
    function(widget, stdout)
        local header = beautiful.gpu_icon
        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.gpu_icon_color, header))
            ..
            markup.font(beautiful.font, markup(beautiful.fg_normal," ".. stdout .. "%"))
        )
    end
)
gpu:buttons (
    awful.button({},1, function () --left click
            awful.spawn(apps.gpumonitor)
    end)
)

return gpu
