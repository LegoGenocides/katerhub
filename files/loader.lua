-- // katerhub v5 loader //
local katerhubgithub = 'https://raw.githubusercontent.com/LegoGenocides/katerhub/'
local GetHttp = function(url)
    local success,response = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        return response
    end
    return nil, response
end

local Game = GetHttp(katerhubgithub .. 'refs/heads/main/files/addons/'..tostring(game.PlaceId)..'.lua')
if Game then
    loadstring(Game)()
else
    loadstring(
        GetHttp(katerhubgithub .. 'refs/heads/main/files/universal.lua')
    )()
end
