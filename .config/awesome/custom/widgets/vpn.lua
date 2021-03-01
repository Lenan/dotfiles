local beautiful = require("beautiful")
local nvpn = require("custom.widgets.nordvpn")

local nordvpn = nvpn({
        notification_position = "top_right",
	connected_icon = beautiful.vpn_icon_connected,
	disconnected_icon = beautiful.vpn_icon_disconnected
})

return nordvpn
