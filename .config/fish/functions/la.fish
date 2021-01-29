# Defined in - @ line 1
function la --wraps='lsd -Al' --description 'alias la=lsd -Al'
  lsd -Al $argv;
end
