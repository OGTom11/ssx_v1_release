-- 3 layers of protection (friends with, inGroup, usernameSimilarity)

local userPlaceholder = 112
local groupPlaceholder = 112

local check1
local check2
local check3

local finalResult

game.Players.PlayerAdded:Connect(function(player)
    -- Friends with check
    if player:IsFriendsWith(userPlaceholder) then
        check1 = true
        return player.Name" is friends with "..userPlaceholder
    end

    if player:IsInGroup(groupPlaceholder) then
        check2 = true
        return player.Name" is in "..groupPlaceholder
    end

    if player.HasVerifiedBadge then
        return
    else
        check3 = true
        return player.Name" is not verified"
    end
end)

if check1 == true and check2 == true and check3 == false then
    -- Probs an alt account
    finalResult = true
    elseif check1 == true and check2 == true and check3 == true then
     -- less chance of an alt
    finalResult = true
    else
        finalResult = false
end