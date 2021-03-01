# Personal dotfiles
These are my personal dotfiles. If you want to use my setup/colors, you will have to kinda mix and match... I've left some notes for the most important parts.
####Program list:

* [AwesomeWM(git)](https://awesomewm.org) most of my configs are configured for this WM <br>
* [rofi](https://github.com/davatorium/rofi)
* [pywal](https://github.com/dylanaraps/pywal) 
* [Variety](https://github.com/varietywalls/variety)<br>
*Note:*I slightly modified the setter script to work better with AwesomeWm and to generate colorschemes with pywall


## Additional setup information:
#### Fonts:
* Iosevka (Used in Kitty as terminal font)
* Terminus
* Any Nerd Font patched Font for the glyphs

#### AwesomeWM Widgets:
*	[lain widgets](https://github.com/lcpz/lain)

#### Pywal
There are some colorschemes we need to hook up manually. Before we can do that though, you'll have to run `pywal` atlest once or else it doesn't generate the necessary files. After you do that
the generated colorschemes are in the `~/.cache/wal/` directory.

##### AwesomeWM color integration
```
ln -sf ~/.cache/wal/awesome-colors.lua ~/.config/awesome/awesome-colors.lua
```
