local apps = {
    terminal = "kitty",
    musicplayer = "ncmpcpp",
    volcontrol = "pavucontrol",
    sysmonitor = "bpytop",
    gpumonitor = "gew",
    term_filebrowser = "l", -- l is an alias for lf 
    browser = os.getenv("BROWSER") or "firefox",
    browser2 = "qutebrowser",
    editor = os.getenv("EDITOR") or "nvim",
    gui_editor = os.getenv("EDITOR") or "emacs",
    voicechat = "teamspeak3",
    -- gamelib = "steam",
    gamelib = "exo-open /usr/share/applications/steam-screensaver-fix-runtime.desktop", -- Steam inhibits monitor sleep etc. This workaround fixes it. See https://github.com/ValveSoftware/steam-for-linux/issues/5607 for details
    -- pwmanager = "bwmenu"
    pwmanager = 'rofi-rbw --rofi-args "-theme /home/lenan/.config/rofi/launchers/colorful/style_2.rasi"'
}
return apps
