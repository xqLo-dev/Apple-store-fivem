ESX = nil


local Shop = {   
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_Green}, HeaderColor = {0, 0, 0}, --[[R, G, B ]]Title = 'Apple Store'},
	Data = { currentMenu = "Apple Store", GetPlayerName()},
  Events = { 
	onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
  PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)


      local btn = btn.name
          
      

if btn == "Iphone 11" then  
   
  TriggerServerEvent('xqLos', 500, 'phone', 1)

end

if btn == "Samsung Galaxy S9" then  
   
  TriggerServerEvent('xqLos', 400, 'phone', 1)

end

if btn == "Wiko" then  
   
  TriggerServerEvent('xqLos', 200, 'phone', 1)

end

if btn == "Carte Sim" then  
   
  TriggerServerEvent('xqLos', 50, 'sim', 1)

end

if btn == "AirPods" then  
   
  TriggerServerEvent('xqLos', 100, 'airpods', 1)

end

if btn == "Coque rouge" then  
   
  TriggerServerEvent('xqLos', 130, 'sim', 1)

end


if btn == "Accessoires" then
  
  OpenMenu("Voici les ~r~accessoires~s~ disponibles !")
    
end


if btn == "Téléphones" then
  
  OpenMenu('Voici les ~r~téléphones~s~ disponibles')
    
end

end,     
	},    
	
  
  Menu = {  
		["Apple Store"] = { 
			b = { 
        {name = "Téléphones", ask = "→", askX = true},
        {name = "Accessoires", ask = "→", askX = true},
			}  
		},
    ["Voici les ~r~téléphones~s~ disponibles"] = { 
			b = { 
        {name = "Iphone 11", ask = "~g~$500", askX = true},
        {name = "Samsung Galxy S9",ask = "~g~$400", askX = true},
        {name = "Wiko",ask = "~g~$20", ask = "~g~$200", askX = true},
			}  
		},
    ["Voici les ~r~accessoires~s~ disponibles !"] = { 
			b = { 
        {name = "Carte Sim", ask = "~g~$50", askX = true},
        {name = "AirPods", ask = "~g~$100", askX = true},
        {name = "Coque rouge", ask = "~g~$30", askX = true},
			}  
		},
	}
}    


local xqLo = {
  --{x = 25.651, y= -1346.872, z=29.49} Pour rajouter un shop Apple vous devez rajouter la pos ici
  {x = 149.5, y= -232.9, z= 54.4}
} 

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0) 
      for k in pairs(xqLo) do
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, xqLo[k].x, xqLo[k].y, xqLo[k].z)
          if dist <= 2.0 then 
              ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'Apple store !")
              if IsControlJustPressed(1,38) then 			
               CreateMenu(Shop)    
                  end
              end 
          end
      end
  end)

  local blips = {
    -- Exemple {title="", colour=, id=, x=, y=, z=},
   {title="Apple shop", colour=4, id=76, x = 149.5, y= -232.9, z= 54.4}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
