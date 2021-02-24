local apps = {
  terminal = "kitty",
  musicplayer = "ncmpcpp",
  volcontrol = "pavucontrol",
  sysmonitor = "gotop",
  gpumonitor = "gew",
  browser = os.getenv("BROWSER") or "firefox",
  browser2 = "qutebrowser",
  editor = os.getenv("EDITOR") or "nvim",
  gui_editor = os.getenv("EDITOR") or "emacs"
}
return apps
