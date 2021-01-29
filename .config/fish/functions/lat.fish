# Defined in - @ line 1
function lat --wraps='lsd -Al --total-size' --wraps='lsd -Al --total-size -I .cache' --wraps='lsd -Al --total-size -I .cache/paru' --wraps=lsd\ -Al\ --total-size\ -I\ .cache\\/paru --wraps='lsd -Al --total-size -I paru' --description 'alias lat=lsd -Al --total-size -I .cache'
  lsd -Al --total-size -I .cache $argv;
end
