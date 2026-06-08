-- // katerhub v5 loader //
local github = 'https://raw.githubusercontent.com/LegoGenocides/katerhub/' -- katerhubs github path
local payload = (...)
local GetHttp = function(url)
    local success,response = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        return response
    end
    return nil, response
end

local Game = GetHttp(github .. 'refs/heads/main/files/addons/' .. tostring(game.PlaceId) .. '.lua')
if Game then
    katerhub = loadstring(Game)
else
    local universal = GetHttp(github .. 'refs/heads/main/files/universal.lua')
    if universal then
        katerhub = loadstring(universal)
    end
end

if katerhub then katerhub(payload) else print("[katerhub] universal url not avalibe") end
