function logger(type, message, ...)
	if type == 'log' then
		print((message):format(...))
  elseif type == 'info' then
		print(('[INFO] ' .. message):format(...))
	elseif type == 'debug' then
		print(('[DEBUG] ' .. message):format(...))
	elseif type == 'warn' then
		print(('[^1WARNING^7] ' .. message):format(...))
	elseif type == 'error' then
		print(('[^1ERROR^7] ' .. message):format(...))
	end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

function Stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end

    local t={} ; i=1

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end

    return t
end

function tPrint(tbl, indent)
	indent = indent or 0
	for k, v in pairs(tbl) do
		local tblType = type(v)
		formatting = string.rep("  ", indent) .. k .. ": "
		if tblType == "table" then
			print(formatting)
			tPrint(v, indent + 1)
		elseif tblType == 'boolean' then
			print(formatting .. tostring(v))
		elseif tblType == "function" then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end
