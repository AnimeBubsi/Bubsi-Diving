Progressbars = function(time, text)
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

  elseif Config.Progressbar == 'codeforge' then

  exports['forge-progress']:StartProg(text, time)

  elseif Config.Progressbar == 'Custom' then

   end
end

RegisterNetEvent('Bubsinotify')
AddEventHandler('Bubsinotify', function(time, text, type)
    if Config.notify == 'brutal' then
	exports['brutal_notify']:SendAlert("Diving", text, time, type) -- Brutal notify
    elseif Config.notify == 'qb' then
	TriggerEvent('QBCore:Notify', text, type, time) -- qb notify
    elseif Config.notify == 'esx' then
	ESX.ShowNotification(text, type, time)
    end
end)

textui = function(type, teksti)
  if type == 'show' then
   if Config.textui == 'ox_lib' then
lib.showTextUI(teksti, {
    position = "left-center",
    icon = 'hand',
    style = {
        borderRadius = 0,
        backgroundColor = '#48BB78',
        color = 'white'
    }
})
   elseif Config.textui == 'okok' then
      exports['okokTextUI']:Open(teksti, 'darkblue', 'right')
   elseif Config.textui == 'codeforge' then
      exports['forge-text']:Show(teksti, 'left')
   elseif Config.textui == 'custom' then

end
  elseif type == 'hide' then
   if Config.textui == 'ox_lib' then
     lib.hideTextUI()
   elseif Config.textui == 'okok' then
     exports['okokTextUI']:Close()
   elseif Config.textui == 'codeforge' then
     exports['forge-text']:Hide()
   elseif Config.textui == 'custom' then

    end
  end
end