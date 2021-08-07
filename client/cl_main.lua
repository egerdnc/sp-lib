UIFocus = false

Citizen.CreateThread(function()
    TriggerServerEvent("sp-infinity:addPlayer")
end)
  
function SetUIFocus(hasFocus, hasCursor)
    SetUIFocusCustom(hasFocus, hasCursor)
end
  
function GetUIFocus()
    return UIFocus
end

function SetUIFocusCustom(hasKeyboard, hasMouse)
    UIFocus = hasKeyboard or hasMouse
  
    SetNuiFocus(hasKeyboard, hasMouse)
    SetNuiFocusKeepInput(HasNuiFocus)
end
