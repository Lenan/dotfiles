# Defined via `source`
function dfp --wraps='dotfiles push' --description 'alias dfp=dotfiles push'
  dotfiles push $argv; 
end
