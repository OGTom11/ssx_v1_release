
local net = Instance.new("BindableEvent")
net.Name = "Network"
net.Parent = script.Parent
local whitelist = require(script.ModuleScript).userWhitelist

if table.find(whitelist, game.CreatorId) then
	print("[ssx] Valid License | Anti-Exploit ready.")
else
	print("[ssx] Missing/Invalid License.")
	script:Destroy()
end

playersInGame = {}
local DSS = game:GetService("DataStoreService")
playersBanned = DSS:GetDataStore("playersBanned")
discordW = false


function punishments(plr, offense)
	if offense == "walkspeed" then
		return "kick"
	end
end


game.Players.PlayerAdded:Connect(function(plr)
	print(plr.Name.." joined "..game.Name)

	playersBanned:RemoveAsync(plr.Name, plr.LocaleId)

	if playersBanned:GetAsync(plr.Name, plr.LocaleId) then -- Ban Checker
		plr:Kick("ssx Anti-Exploit | "..plr.Name.." is banned.")
	else
		return
	end
end)


net.Event:Connect(function(player, offense)
	if offense == "walkspeed" then
		punishments(player, "walkspeed")
		if punishments() == "kick" then
			player:Kick("ssx Anti-Exploit | Player Speed mismatch.")
			print("[ssx]"..player.Name.." was KICKED for a walkspeed mismatch with the server.")
		end
	end
end)

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(character)
		local Humanoid = plr.Character.Humanoid

		Humanoid.Running:Connect(function(speed)
			if speed > 17 then
				net:Fire(plr, "walkspeed")
			end
		end)
	end)
end)


