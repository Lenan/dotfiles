local apps = {
  terminal = "kitty",
  musicplayer = "ncmpcpp",
  volcontrol = "pavucontrol",
  sysmonitor = "bpytop",
  gpumonitor = "gew",
  term_filebrowser = "ranger",
  browser = "qutebrowser",
  browser2 = os.getenv("BROWSER") or "firefox",
  editor = os.getenv("EDITOR") or "nvim",
  gui_editor = os.getenv("EDITOR") or "emacs",
  voicechat = "teamspeak3",
  gamelib = "steam",
  pwmanager = "bwmenu"
}
return apps
