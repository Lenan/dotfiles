# Defined via `source`
function dfc --wraps='dotfiles commit -m' --description 'alias dfc=dotfiles commit -m'
  dotfiles commit -m $argv; 
end
