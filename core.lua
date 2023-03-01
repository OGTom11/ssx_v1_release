local net = Instance.new("BindableEvent")
net.Name = "Network"
net.Parent = script.Parent
local web = game:GetService("HttpService"):GetAsync("http://localhost:3000/whitelisted-users")
local jsonDecoded = game:GetService("HttpService"):JSONDecode(web)

if table.find(jsonDecoded, game.CreatorId) then
	print("[ssx] Missing/Invalid License.")
else
	print("[ssx] Missing/Invalid License.")
end

playersInGame = {}
local DSS = game:GetService("DataStoreService")
playersBanned = DSS:GetDataStore("playersBanned")
discordW = false


game.Players.PlayerAdded:Connect(function(plr)
	print(plr.Name.." joined "..game.Name)
	
	playersBanned:RemoveAsync(plr.Name, plr.LocaleId)
	
	if playersBanned:GetAsync(plr.Name, plr.LocaleId) then -- Ban Checker
		plr:Kick("ssx Anti Exploit | "..plr.Name.." is banned.")
	else
		return
	end
end)


net.Event:Connect(function(player, offense)
	if offense == "walkspeed" then
		player:Kick("ssx Anti Exploit | Player Speed mismatch.")
		playersBanned:SetAsync(player.Name, player.LocaleId)
	end

	
end)

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(character)
		local Humanoid = plr.Character.Humanoid

		Humanoid.Running:Connect(function(speed)
			if speed > 16 then
				net:Fire(plr, "walkspeed")
			end
		end)
	end)
end)

