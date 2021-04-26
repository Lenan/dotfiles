local apps = {
    terminal = "kitty",
    musicplayer = "ncmpcpp",
    volcontrol = "pavucontrol",
    sysmonitor = "bpytop",
    gpumonitor = "gew",
    term_filebrowser = "ranger",
    browser = os.getenv("BROWSER") or "firefox",
    browser2 = "qutebrowser",
    editor = os.getenv("EDITOR") or "nvim",
    gui_editor = os.getenv("EDITOR") or "emacs",
    voicechat = "teamspeak3",
    gamelib = "steam",
    -- pwmanager = "bwmenu"
    pwmanager = 'rofi-rbw --rofi-args "-theme /home/lenan/.config/rofi/launchers/text/style_1.rasi"'
}
return apps
