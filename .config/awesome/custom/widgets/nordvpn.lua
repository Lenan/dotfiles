--------------------------------------------------------------------------------
-- NordVPN Status Widget
-- Icon shows connected/disconnected, notification shows more details
-- More details could be found here:
-- https://bitbucket.org/easlice/awesome-as-widgets

-- @author Andrew Slice
-- @license MIT
--------------------------------------------------------------------------------

local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local spawn     = require("awful.spawn")
local naughty   = require("naughty")
local beautiful = require("beautiful")
local lain      = require("lain")
local markup    = lain.util.markup

local CONNECTED_GLYPH     = beautiful.vpn_icon_connected
local DISCONNECTED_GLYPH  = beautiful.vpn_icon_disconnected
local NORD_STATUS_CMD     = 'nordvpn status'
local NORD_CONNECT_CMD    = 'nordvpn c'
local NORD_DISCONNECT_CMD = 'nordvpn d'

local this = { connected = false }


-- returns the connected state
local function parse_connected(stdout)
    local status = string.match(stdout, "Status: (%a+)")
    if status ~= nil and status:lower() == "connected" then
        return true
    end
    return false
end

-- Set the icons and last_stdout based on the parse results
local function update_status(vpn_conn_obj, stdout, _, _, _)
    local is_connected = parse_connected(stdout)
    vpn_conn_obj.connected = is_connected

    -- There's come crud in the output by default, so let's remove that
    stdout = "\n" .. stdout:gsub("^%W*[\r\n]*","")

    vpn_conn_obj.last_stdout = stdout;
    if is_connected then
        vpn_conn_obj.widget:set_markup(markup.font(beautiful.icon_font, markup(beautiful.vpn_icon_color, CONNECTED_GLYPH)))
    else
        vpn_conn_obj.widget:set_markup(markup.font(beautiful.icon_font, markup(beautiful.fg_normal, DISCONNECTED_GLYPH)))
    end

    if vpn_conn_obj.display_notification and vpn_conn_obj.notification then
        naughty.replace_text(vpn_conn_obj.notification, "VPN Connection Status", stdout)
    end
end

local function worker(args)
    local args = args or {}

    this.display_notification = args.display_notification or true
    this.notification_position = args.notification_position or "top_right"

    this.widget = wibox.widget.textbox()

    -- Run a given command and then run an update command.
    function this:_cmd(cmd)
        spawn.easy_async(
            cmd,
            function(stdout, stderr, exitreason, exitcode)
                this:_update()
            end
        )
    end

    -- Get the latest status and update the info in the widget
    function this:_update()
        spawn.easy_async(
            NORD_STATUS_CMD,
            function(stdout, _, _, _)
                update_status(this, stdout)
            end
        )
    end

    -- Show the notification
    --     keep, if true, makes the notification not fade out
    function this:_show(keep)
        if this.display_notification then
            naughty.destroy(this.notification)
            this.notification = naughty.notify{
                text = this.last_stdout,
                title = "VPN Connection Status",
                position = this.notification_position,
                timeout = keep and 0 or 2,
                hover_timeout = 0.5,
            }
        end
    end

    -- toggle the connection on and off
    function this:_toggle()
        if this.connected then
            this:_cmd(NORD_DISCONNECT_CMD)
        else
            this:_cmd(NORD_CONNECT_CMD)
        end
    end


    -- Mouse Events
    this.widget:connect_signal("button::press", function(_,_,_,button)
        if (button == 1) then this._toggle() end
    end)

    if this.display_notification then
        this.widget:connect_signal("mouse::enter", function() this:_update();this:_show(true) end)
        this.widget:connect_signal("mouse::leave", function() naughty.destroy(this.notification) end)
    end
    ----------------------------------------------------------------------------

    this:_update()
    watch(
        GET_NORD_STATUS_CMD,
        5,
        function() this:_update() end,
        this.widget
    )
    return this.widget
end

return setmetatable(this, { __call = function(_, ...) return worker(...) end })
