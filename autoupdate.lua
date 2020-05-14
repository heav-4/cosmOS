local s,e=pcall(function()
  local function fwrite(f,i)
    local f=fs.open(f,"w")
    f.write(i)
    f.close()
  end

  local function fread(f)
    local f=fs.open(f,"r")
    local i=f.readAll()
    f.close()
    return i
  end

  local function fwrite_lon(f,j)
    local f=fs.open(f,"w")
    f.write(textutils.serialize(j))
    f.close()
  end

  local function fread_lon(f)
    local f=fs.open(f,"r")
    local i=textutils.unserialize(f.readAll())
    f.close()
    return i
  end

  if not fs.exists(".cosmOS_fvi.lon") then
    fwrite_json(".cosmOS_fvi.lon",{})
    a=fvg
  end
end)
if not s then
  print("oh no, a bad thing happened: \n"..e)
end
