# Personal dotfiles
These are my personal dotfiles. If you want to use my setup/colors, you will have to kinda mix and match... I've left some notes for the most important parts.
#### Window Manager(s)

* [AwesomeWM(git)](https://awesomewm.org) most of my configs are configured for this WM <br>
* or [i3-gaps](https://github.com/Airblader/i3)
	
#### Bars (for i3-gaps only)
* [polybar](https://github.com/polybar/polybar)

#### Notification Daemon (for i3-gaps only)
* [dunst](https://dunst-project.org/)

#### Application Menu
* [rofi](https://github.com/davatorium/rofi)

#### Wallpaper setter
* [Variety](https://github.com/varietywalls/variety)<br>
I slightly modified the setter script to work better with AwesomeWm and to generate colorschemes with pywall

#### Color generator
* [pywal](https://github.com/dylanaraps/pywal) 



## Additional setup information:
#### Fonts:
* Noto Sans (used everywhere unless overwritten by the fonts below)
* Arimo (Used in AwesomeWM's bar)
* SauceCode (Fallback font for glyphs)
* Iosevka (Used in Kitty as terminal font)

*Note:* All of them are the [Nerd Font](https://www.nerdfonts.com/) patched versions

#### AwesomeWM Widgets:
*	[lain widgets](https://github.com/lcpz/lain)
* [keyboard_layout](https://github.com/echuraev/keyboard_layout)

#### Pywal
There are some colorschemes we need to hook up manually. Before we can do that though, you'll have to run `pywal` atlest once or else it doesn't generate the necessary files. After you do that
the generated colorschemes are in the `~/.cache/wal/` directory.

##### AwesomeWM color integration
```
ln -sf ~/.cache/wal/awesome-colors.lua ~/.config/awesome/awesome-colors.lua
```
##### Dunst
```
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
```
