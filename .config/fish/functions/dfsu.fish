# Defined via `source`
function dfsu --wraps='dotfiles status -u' --description 'alias dfsu=dotfiles status -u'
  dotfiles status -u $argv; 
end
