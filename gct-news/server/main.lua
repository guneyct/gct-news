local QBCore = exports["qb-core"]:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.NewspaperItem, function(source, item)
    local src = source
    
    TriggerClientEvent("gct-news:client:openNews", src, item.info.url)
end)

RegisterNetEvent("gct-news:server:buyNew", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)

    if Player then
        MySQL.Async.fetchAll("SELECT * FROM gct_newspaper ORDER BY id DESC LIMIT 1", {}, function(result)
            if result[1] then
                local date = os.date("%d/%m/%Y", tonumber(result[1].date))
                local info = {
                    date = date,
                    url = result[1].url
                }

                if Player.Functions.AddItem("newspaper", 1, false, info) then
                    TriggerClientEvent('QBCore:Notify', source, "Gazete Alındı!", "success")
                end
            end
        end)
    end
end)

RegisterNetEvent("gct-news:server:uploadNews", function(url)
    MySQL.Async.execute("INSERT INTO gct_newspaper (`url`, date) VALUES (@url, @date)", {
        ["@url"] = url,
        ["@date"] = os.time()
    }, function(result)
        -- ok
    end)
end)