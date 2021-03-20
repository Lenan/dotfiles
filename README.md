# Personal dotfiles
These are my personal dotfiles. If you want to use my setup/colors, you're on your own :P<br>
Quicknote: I have 2 monitors, both with a resolution of 2560x1440. I'm guessing the themes will look terrible on anything below that resolution.

## My ''default'' programs:
* [AwesomeWM(git)](https://awesomewm.org)
* [kitty](https://sw.kovidgoyal.net/kitty/)
* [fish](http://fishshell.com/)
* [rofi](https://github.com/davatorium/rofi)
* [pywal](https://github.com/dylanaraps/pywal) 
* [Variety](https://github.com/varietywalls/variety)
* [Neovim](https://neovim.io/)
* [Ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)

`Note: I slightly modified variety's setter script to work better with AwesomeWM and to generate colorschemes with pywall`


## Additional setup information:
#### Fonts:
* Iosevka (Used in Kitty as terminal font)
##### Theme: RPG
* Terminus (Used in Theme 'rpg' as default font)
* Any Nerd Font patched Font for the glyphs (Adjust `icon_font` in `awesome/themes/rpg/theme.lua` accordingly)

##### Theme: Variety
* Intern (Used in Theme 'variety' as default font)
* Font Awesome 5(free) (Used as glyph font)
The reason for font awesome 5 instead of nerd fonts is that, not all the FA5 glyphs I wanted are patched into nerd fonts :/

#### AwesomeWM Widgets:
* [lain widgets](https://github.com/lcpz/lain)

#### Pywal(used with theme variety)
There are some colorschemes we need to hook up manually. First copy the wal template into `~/.config/wal/template`. Afterwars, run `pywal` atlest once or it doesn't generate the necessary files.
After you do that, the generated colorschemes are in the `~/.cache/wal/` directory.

##### AwesomeWM color integration
```
ln -sf ~/.cache/wal/awesome-colors.lua ~/.config/awesome/awesome-colors.lua
```
