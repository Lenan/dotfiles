# Defined via `source`
function lt --wraps='lsd -A --tree --depth 3' --wraps='lsd -A --tree --depth 3 -I .cache' --wraps='lsd -A --tree --depth 3 -I .cache | bat' --wraps='~/Documents/Projects/Rust/lsd/target/debug/lsd -A --tree --depth 3 -I .cache --icon-theme devicons | bat' --wraps='~/Documents/Projects/Rust/lsd/target/debug/lsd -A --tree --depth 3 -I .cache --icon-theme devicons | bat --style="plain"' --description 'alias lt ~/Documents/Projects/Rust/lsd/target/debug/lsd -A --tree --depth 3 -I .cache --icon-theme devicons | bat --style="plain"'
  ~/Documents/Projects/Rust/lsd/target/debug/lsd -A --tree --depth 3 -I .cache --icon-theme devicons | bat --style="plain" $argv; 
end
