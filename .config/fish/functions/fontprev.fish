# Defined via `source`
function fontprev --wraps=fontpreview-ueberzug\ -b\ \(cat\ \~/.config/xresources-colors/horizon\ \|\ grep\ background\ \|\ cut\ -d\ \'\ \'\ -f\ 3\ \)\ -f\ \'\#ffffff\' --wraps='fontpreview-ueberzug -b (cat ~/.config/xresources-colors/horizon | grep background | cut -d " " -f 3 ) -f "#ffffff"' --description 'alias fontprev fontpreview-ueberzug -b (cat ~/.config/xresources-colors/horizon | grep background | cut -d " " -f 3 ) -f "#ffffff"'
  fontpreview-ueberzug -b (cat ~/.config/xresources-colors/horizon | grep background | cut -d " " -f 3 ) -f "#ffffff" $argv; 
end
