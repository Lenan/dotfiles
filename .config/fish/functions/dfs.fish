# Defined via `source`
function dfs --wraps='dotfiles status' --description 'alias dfs=dotfiles status'
  dotfiles status $argv; 
end
