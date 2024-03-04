if Config.Framework == 'esx' then
ESX = exports["es_extended"]:getSharedObject()

callback = ESX.TriggerServerCallback

else
local QBCore = exports['qb-core']:GetCoreObject()

callback = QBCore.Functions.TriggerCallback
end

local ootaha, refill, auki = false, false, false

function loadAnimDict(dict) 
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

Citizen.CreateThread(function()
    while true do
        local Bubsi = 500
        local maa = GetEntityHeightAboveGround(PlayerPedId())
        if IsPedSwimmingUnderWater(PlayerPedId()) and maa < 2.0 and ootaha == false then
	Bubsi = 5
	textui('show', Config.locales.tutki)
	auki = true
 		if IsControlJustPressed(0, 38) and ootaha == false then
		   ootaha = true
		   loadAnimDict( "random@domestic" )
	TaskPlayAnim( PlayerPedId(), "random@domestic", "pickup_low", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
	Citizen.Wait(2000)
	ClearPedTasksImmediately(PlayerPedId())
		   palkkio('Bubsipalkkio')
            end
         end
	  if maa > 2.0 and auki or ootaha and auki then
	  textui('hide')
          auki = false
	   end
	Citizen.Wait(Bubsi)
    end
end)


palkkio = function(event)
local Bubsikey = 'Bubsinkeyjuttusysteemi' -- somekinda protect system?
TriggerServerEvent(event, Bubsikey)
end

Citizen.CreateThread(function()
  while true do
   Citizen.Wait(500)
	local nopeus = GetEntitySpeed(PlayerPedId())
	if ootaha and nopeus > 0.3 then
	  Citizen.Wait(9500)
		ootaha = false
	end
   end
end) 

RegisterNetEvent('Bubsimaski')
AddEventHandler('Bubsimaski', function()
	loadAnimDict( "clothingshirt" )
	TaskPlayAnim( PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
	if Config.useprogress then
	Progressbars(4000, Config.locales.progressbars)
	end
	Citizen.Wait(4000)
	ClearPedTasksImmediately(PlayerPedId())
	local Scubatank = GetHashKey("p_s_scuba_tank_s")
            			SetPedScubaGearVariation(PlayerPedId())
            			Scubatank = CreateObject(Scubatank, 1.0, 1.0, 1.0, 1, 1, 0)
            			CreateObject(Scubatank, 1.0, 1.0, 1.0, 1, 1, 0)	
            			local bone1 = GetPedBoneIndex(PlayerPedId(), 24818)
            			AttachEntityToEntity(Scubatank, PlayerPedId(), bone1, -0.29, -0.23, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
				SetPedDiesInWater(PlayerPedId(), false)
				TriggerEvent('Bubsinotify', 5000, Config.locales.happea100, Config.types.info)
				Wait (100000)
				TriggerEvent('Bubsinotify', 5000, Config.locales.happea50, Config.types.info)
				Wait (85000)
				TriggerEvent('Bubsinotify', 5000, Config.locales.happea25, Config.types.info)
				Wait (15000)
				TriggerEvent('Bubsinotify', 5000, Config.locales.happea5, Config.types.info)
				Wait (5000)
				TriggerEvent('Bubsinotify', 5000, Config.locales.happea0, Config.types.info)
				ClearPedScubaGearVariation(PlayerPedId())
				DeleteObject(Scubatank)	
				SetPedDiesInWater(PlayerPedId(), true)
				palkkio('Bubsikmaski')
end)

Citizen.CreateThread(function()
    while true do
        local Bubsi = 500
	local coords = GetEntityCoords(PlayerPedId())
	local dist = #(Config.refillplace - coords)

           if dist < 1.0 and refill == false then
            Bubsi = 5
	    textui(show, Config.locales.refilltank)
	    if IsControlJustPressed(0, 38) and refill == false then
              callback('Bubsioxygentank', function(tank)
	      if tank then
		refill = true
		local Scubatank = GetHashKey("p_s_scuba_tank_s")
            	local Scubatank2 = CreateObject(Scubatank, coords.x + 0.5, coords.y, coords.z, 1, 1, 0)
		PlaceObjectOnGroundProperly(Scubatank2)
		if Config.useprogress then
		Progressbars(10000, Config.locales.progressbars2)
		end
	        loadAnimDict( "anim@amb@clubhouse@tutorial@bkr_tut_ig3@" )
	        TaskPlayAnim( PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
		Citizen.Wait(10000)
		DeleteObject(Scubatank2)
		ClearPedTasksImmediately(PlayerPedId())
		palkkio('Bubsitankki')
		refill = false
	     elseif tank == false then
		TriggerEvent('Bubsinotify', 5000, Config.locales.eioletankki, Config.types.error)
	     elseif dist < 1.0 then
		textui(hide)

             end
	   end)
	  end
	 end
   Citizen.Wait(Bubsi)
   end
end) 

Citizen.CreateThread(function()

	if Config.refillblip.use then

      local blip = AddBlipForCoord(Config.refillplace)
      SetBlipSprite(blip, Config.refillblip.sprite)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, Config.refillblip.scale)
      SetBlipColour(blip, Config.refillblip.colour)
      SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(Config.refillblip.name)
      EndTextCommandSetBlipName(blip)
   end
end)


