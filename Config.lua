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
   "pullo",
   "rkaulakoru",
   "rsormus",
   "lasipullo",
   "sormus"
}

Config.rareitem = { -- 1 in 100 chance
   "pulloposti",
   "rolex"
}


----[ Notification ]----

Config.notify = 'brutal' -- brutal, qb, esx

Config.types = { -- Notification types
  error = 'error',
  success = 'success',
  info = 'info'
}

----[ Progressbar ]----

Config.useprogress = true -- Do you want to use progressbars?

Config.Progressbar = 'sx' -- sx, qb, Buty, Bcall, codeforge, Custom (cl_utils)

----[ Textui ]----

Config.textui = 'codeforge' -- ox_lib, okok, codeforge, custom

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

