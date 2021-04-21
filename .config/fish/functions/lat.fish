# Defined via `source`
function lat --wraps='lsd -Al --total-size' --wraps='lsd -Al --total-size -I .cache' --wraps='lsd -Al --total-size -I .cache/paru' --wraps=lsd\ -Al\ --total-size\ -I\ .cache\\/paru --wraps='lsd -Al --total-size -I paru' --wraps='~/Documents/Projects/Rust/lsd/target/debug/lsd -Al --total-size -I .cache --icon-theme devicons' --description 'alias lat ~/Documents/Projects/Rust/lsd/target/debug/lsd -Al --total-size -I .cache --icon-theme devicons'
  ~/Documents/Projects/Rust/lsd/target/debug/lsd -Al --total-size -I .cache --icon-theme devicons $argv; 
end
