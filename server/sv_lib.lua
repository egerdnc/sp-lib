function addDiscordLog(pHook, pColor, pName, pMessage, pFooter)
    local embed = {
        {
            ["color"] = pColor,
            ["title"] = "".. pName .."",
            ["description"] = pMessage,
            ["footer"] = {
                ["text"] = pFooter,
            },
        }
    }

  PerformHttpRequest(tostring(pHook), function(err, text, headers) end, 'POST', json.encode({username = pName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function generateUTCTimestamp()
    local now = os.time()
    local tz_offset = os.difftime(now, os.time(os.date("!*t", now)))
    local epoch = os.time(os.date("!*t"))
    local utc = epoch + tz_offset
    return math.floor(utc)
  end
  
  function stringJoin(pData, pSeparator)
    local values = ""
    for _, value in pairs(pData) do
      values = values .. ("'%s'"):format(value) .. pSeparator
    end
    return (values):sub(1, #values - 1)
  end

  function getIdentifier(src, isSteam)
    if isSteam == true then
      return GetPlayerIdentifiers(src)[1]
    else
      for k,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, 7) == "license" then
            return v
        end
      end
    end
    return nil
end
