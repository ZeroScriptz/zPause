
local display = false


Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        SetPauseMenuActive(false)
        if IsControlJustReleased(0, 200) or IsControlJustReleased(0, 199) and IsInputDisabled(0) then
            SetDisplay(true)
            SetNuiFocus(true, true)
            TriggerScreenblurFadeIn(1)
        end

        
    end
end)




RegisterNUICallback("resume", function()
    SetDisplay(false)
    CloseDisplay(true)
    TriggerScreenblurFadeOut(1000)
end)
RegisterNUICallback("map", function()
    SetDisplay(false)
    TriggerScreenblurFadeOut(1000)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),1,-1)
    SetDisplay(false)
    if ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),1,-1) then
        SetDisplay(false)
    end

end)
RegisterNUICallback("settings", function()
    SetDisplay(false)
    TriggerScreenblurFadeOut(1000)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1)       
    SetDisplay(false)
    if ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) then
        SetDisplay(false)
    end

end)

RegisterNUICallback("quit", function()
    SetDisplay(false)
    TriggerScreenblurFadeOut(1000)
    TriggerServerEvent("quit")
end)

RegisterNUICallback("stop", function()
    SetDisplay(false)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(1)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    EnableControlAction(1, 200)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

function CloseDisplay()
    SetDisplay(false)
    display = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "closeAll"
    })
end

  