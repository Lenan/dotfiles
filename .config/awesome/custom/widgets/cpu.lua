local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local apps = require("custom.apps")

local markup = lain.util.markup

local cpu = lain.widget.cpu({
    settings = function()
      local header = beautiful.cpu_icon
      widget:set_markup(
          markup.font(beautiful.icon_font, markup(beautiful.cpu_icon_color, header ))
          ..
          markup.font(beautiful.font, markup(beautiful.fg_normal, " " ..cpu_now.usage .. "%"))
      )
    end
})

cpu.widget:buttons(
  awful.util.table.join(
    awful.button({},1, function()
        awful.spawn(apps.terminal .. " -e " .. apps.sysmonitor)
    end)
  )
)

return cpu
