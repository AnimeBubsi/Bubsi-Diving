function RandomItem()
  return Config.commonitem[math.random(#Config.commonitem)]
end

function RandomItem2()
  return Config.rareitem[math.random(#Config.rareitem)]
end

if Config.Framework == 'esx' then

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('oxygenmask', function(source)
    local Pelaaja = ESX.GetPlayerFromId(source)
	Pelaaja.removeInventoryItem('oxygenmask', 1)
	TriggerClientEvent('Bubsimaski', source)
end)

RegisterServerEvent('Bubsipalkkio')
AddEventHandler('Bubsipalkkio', function(Bubsikey)
local nimi = GetPlayerName(source)
 if Bubsikey == 'Bubsinkeyjuttusysteemi' then
    local chanssi = math.random(1, 100)
    math.randomseed(GetGameTimer())
	  local Pelaaja = ESX.GetPlayerFromId(source)
	   if chanssi > 1 and chanssi < 30 then 	
		Config.notification(5000, Config.locales.eimitaa, 'serveri', Config.types.error)
	   elseif chanssi > 30 and chanssi < 99 then
		Pelaaja.addInventoryItem(RandomItem(), 1)
		Dclogit(Config.vari, Config.locales.otsikko, nimi.. Config.locales.loys.. "**" ..RandomItem().. "**")
	   elseif chanssi == 100 then
		Pelaaja.addInventoryItem(RandomItem2(), 1)
		Dclogit(Config.vari, Config.locales.otsikko, nimi.. Config.locales.loys.. "**" ..RandomItem2().. "**")
	  end
	else
	DropPlayer(source, Config.locales.cheatter)
        Dclogit(Config.vari, Config.locales.otsikko, nimi.. Config.locales.huijjaa)
     end
end)

RegisterServerEvent('Bubsikmaski')
AddEventHandler('Bubsikmaski', function(Bubsikey)
 if Bubsikey == 'Bubsinkeyjuttusysteemi' then
   local Pelaaja = ESX.GetPlayerFromId(source)
      Pelaaja.addInventoryItem('emptyoxygenmask', 1)
   else
       DropPlayer(source, Config.locales.cheatter)
   end
end)

RegisterServerEvent('Bubsitankki')
AddEventHandler('Bubsitankki', function(Bubsikey)
 if Bubsikey == 'Bubsinkeyjuttusysteemi' then
   local Pelaaja = ESX.GetPlayerFromId(source)
      Pelaaja.removeInventoryItem('emptyoxygenmask', 1)
      Pelaaja.addInventoryItem('oxygenmask', 1)
   else
       DropPlayer(source, Config.locales.cheatter)
   end
end)


ESX.RegisterServerCallback('Bubsioxygentank', function(source, cb)
    local Pelaaja = ESX.GetPlayerFromId(source)
    local itemi = Pelaaja.getInventoryItem('emptyoxygenmask').count
      if itemi > 0 then
	cb(true)
      else
        cb(false) 
    end  
end)

end

if Config.Framework == 'qb' then

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('oxygenmask', function(source)
    local Pelaaja = QBCore.Functions.GetPlayer(source)
	Pelaaja.Functions.RemoveItem('oxygenmask', 1)
	TriggerClientEvent('Bubsimaski', source)
end)


RegisterServerEvent('Bubsipalkkio')
AddEventHandler('Bubsipalkkio', function(Bubsikey)
 if Bubsikey == 'Bubsinkeyjuttusysteemi' then
    local chanssi = math.random(1, 100)
	  local Pelaaja = QBCore.Functions.GetPlayer(source)
	   if chanssi > 1 and chanssi < 30 then 	
		Config.notification(5000, Config.locales.eimitaa, 'serveri', Config.types.error)
	   elseif chanssi > 30 and chanssi < 99 then
		 Pelaaja.Functions.AddItem(RandomItem(), 1)
	   elseif chanssi == 100 then
		 Pelaaja.Functions.AddItem(RandomItem2(), 1)
	  end
	else
	DropPlayer(source, Config.locales.cheatter)
     end
end)

RegisterServerEvent('Bubsikmaski')
AddEventHandler('Bubsikmaski', function(Bubsikey)
 if Bubsikey == 'Bubsinkeyjuttusysteemi' then
   local Pelaaja = QBCore.Functions.GetPlayer(source)
      Pelaaja.Functions.AddItem('emptyoxygenmask', 1)
   else
       DropPlayer(source, Config.locales.cheatter)
   end
end)

RegisterServerEvent('Bubsitankki')
AddEventHandler('Bubsitankki', function(Bubsikey)
 if Bubsikey == 'Bubsinkeyjuttusysteemi' then
   local Pelaaja = QBCore.Functions.GetPlayer(source)
      Pelaaja.Functions.RemoveItem('emptyoxygenmask', 1)
      Pelaaja.Functions.AddItem('oxygenmask', 1)
   else
       DropPlayer(source, Config.locales.cheatter)
   end
end)


ESX.RegisterServerCallback('Bubsioxygentank', function(source, cb)
    local Pelaaja = QBCore.Functions.GetPlayer(source)

      if Pelaaja.Functions.GetItemByName('emptyoxygenmask') > 0 then
	cb(true)
      else
        cb(false) 
    end  
end)


end

function Dclogit(color, name, message, dc, footer)
   if Config.uselogs then
    local footer = 'Bubsi - '..os.date("%d/%m/%Y - %X")
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
              ["text"] = footer,

              },
          }
      }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotinNimi, embeds = embed}), { ['Content-Type'] = 'application/json' })
   end
end