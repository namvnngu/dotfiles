local M = {}

function __FILE__()
  return debug.getinfo(3, "S").source
end
function __LINE__()
  return debug.getinfo(3, "l").currentline
end
function __FUNC__()
  return debug.getinfo(3, "n").name or "global"
end

-- Dump information about the passed value
---@param o any
local function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

-- Log with time, function call and line of code
---@param text string
function M.info(text)
  print(
    string.format(
      "[%s(s)][%s:%s] %s",
      os.time(),
      __FILE__(),
      __LINE__(),
      dump(text)
    )
  )
end

return M
