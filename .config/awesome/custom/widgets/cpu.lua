local awful = require("awful")
local lain = require("lain")
local markup = lain.util.markup
local font = require("beautiful").font
local accent = require("awesomewm-colors").fg_focus
local normal = require("beautiful").fg_normal
local apps = require("custom.apps")

cpu = lain.widget.cpu({
    settings = function()
      header = "CPU"
      widget:set_markup(markup.font(font, markup(accent, header) .. markup(normal, cpu_now.usage .. "% ")))
      end
})
cpu.widget:buttons(
  awful.util.table.join(
    awful.button({},1, function()
        awful.spawn(awful.util.terminal .. " -e " .. apps.sysmonitor)
    end)
  )
)

return cpu
