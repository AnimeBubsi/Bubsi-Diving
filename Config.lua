Config = {}

----[ Framework ]----

Config.Framework = 'esx' -- 'esx' or 'qb'

----[ Logs ]----

Config.uselogs = true -- Do you want to use shitty discord logs?

Config.Webhook = '' -- Your webhook

Config.BotinNimi = 'ValorRp' -- Bot name

Config.vari = 500 -- colour

----[ Loot ]----

Config.commonitem = { -- add as many as you want
   "tolkki",
   "pullo"
}

Config.rareitem = { -- 1 in 100 chance
   "pulloposti"
}

----[ Notification ]----

Config.types = { -- Notification types
  error = 'error',
  success = 'success',
  info = 'info'
}

Config.notification = function(time, text, kumpi, type)
  if kumpi == 'Clientti' then
	exports['brutal_notify']:SendAlert("Diving", text, time, type) -- Brutal notify
	--TriggerEvent('QBCore:Notify', text, type, time) -- qb notify
   else
        TriggerClientEvent('brutal_notify:SendAlert', source, 'Diving', text, time, type) -- Brutal notify
	--TriggerEvent('QBCore:Notify', text, type, time) -- qb notify
   end
end

----[ Progressbar ]----

Config.useprogress = true -- Do you want to use progressbars?

Config.Progressbar = 'sx' -- sx, qb, Buty, Bcall, custom

Config.Progressbars = function(time, text)
 if Config.Progressbar == 'sx' then
  TriggerEvent('sx-progress', text, 'info', time) -- sx progress

  elseif Config.Progressbar == 'qb' then

   exports['progressbar']:Progress({
   name = "BubsiDiving",
   duration = time,
   label = text,
   useWhileDead = false,
   canCancel = true,
   controlDisables = {
       disableMovement = false,
       disableCarMovement = false,
       disableMouse = false,
       disableCombat = true,
   }
})

  elseif Config.Progressbar == 'Buty' then

	exports["Buty-Progress"]:on({
        time = time, 
        text = text, 
        color = "linear-gradient(20.5deg, #AC41DE 9.83%, rgba(172, 65, 222, 0) 93.95%)",
        color2 = "#AC41DE",
    }) 

  elseif Config.Progressbar == 'Bcall' then

  exports['BCall_progress']:muestra(time, text)

  elseif Config.Progressbar == 'Custom' then

   end
end

----[ Refill ]----

Config.refillplace = vector3(-1446.52, -1040.65, 4.81)

Config.refillblip = {
 use = true,
 sprite = 597,
 scale = 0.8,
 colour = 3,
 name = "Sukellustankin täyttö"

}

----[ Locales ]----

Config.locales = {
 tutki = '[E] Tutki',
 eimitaa = 'Et löytänyt mitään',
 cheatter = 'Lopeta se huijjaaminen',
 progressbars = 'Puetaan happinaamaria',
 happea100 = 'Happea tankissa 100%',
 happea50 = 'Happea tankissa 50%',
 happea25 = 'Happea tankissa 25%',
 happea5 = 'Happea tankissa 5%',
 happea0 = 'Tankista loppui happi',
 refilltank = '[E] Täyttääksesi sukkelustankin',
 eioletankki = 'Sinulla ei ole sukellustankkia',
 progressbars2 = 'Täytät sukellustankkia',

 ----[ logs ]----

 otsikko = 'Sukellus',
 loys = ' Löyti itemin :',
 huijjaa = ' On kickattu serveriltä, koska hän saattaa modata '
}

