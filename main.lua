local mt = getrawmetatable(game);
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(remote,...)
   args = {...}
   method = tostring(getnamecallmethod())
   if method == "FireServer" and tostring(args[1]) == "FAL" and not tostring(args[2]) then
       args[1] = "Revolver"
       return old(remote,unpack(args))
   end
   return old(remote,...)
end)
setreadonly(mt,true)
