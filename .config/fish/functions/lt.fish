# Defined in - @ line 1
function lt --wraps='lsd -A --tree --depth 3' --wraps='lsd -A --tree --depth 3 -I .cache' --wraps='lsd -A --tree --depth 3 -I .cache | bat' --description 'alias lt=lsd -A --tree --depth 3 -I .cache | bat'
  lsd -A --tree --depth 3 -I .cache | bat $argv;
end
