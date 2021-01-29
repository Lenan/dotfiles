local apps = {
  terminal = "kitty",
  musicplayer = "ncmpcpp",
  sysmonitor = "gotop",
  gpumonitor = "gew",
  browser = os.getenv("BROWSER") or "firefox",
  editor = os.getenv("EDITOR") or "nvim",
  gui_editor = os.getenv("EDITOR") or "emacs"
}
return apps
