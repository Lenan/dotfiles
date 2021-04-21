# Defined via `source`
function ls --wraps=lsd --wraps='~/Documents/Projects/Rust/lsd/target/debug/lsd --icon-theme devicons' --description 'alias ls ~/Documents/Projects/Rust/lsd/target/debug/lsd --icon-theme devicons'
  ~/Documents/Projects/Rust/lsd/target/debug/lsd --icon-theme devicons $argv; 
end
