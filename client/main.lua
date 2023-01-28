local QBCore = exports["qb-core"]:GetCoreObject()

local function createPosts()
    for k, v in pairs(Config.PropModels) do
        local prop = v

        if Config.UseTarget then
            exports['qb-target']:AddTargetModel(prop, {
                options = {
                    {
                        type = "client",
                        event = "gct-news:client:buyNew",
                        icon = "fas fa-newspaper",
                        label = "Gazete Oku",
                        price = Config.NewspaperPrice,
                    },
                },
                distance = 2.5
            })
        end
    end
end

local function createWeazel()
    if Config.UseTarget then
        exports['qb-target']:AddBoxZone("WeazelNews", vector3(-568.89, -929.84, 23.87), 3.5, 3.5, {
            name = "WeazelNews",
            heading = 271.45971,
            minZ = 22.869108,
            maxZ = 24.864952,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "client",
                    event = "gct-news:client:createPaper",
                    icon = "fas fa-sign-in-alt",
                    label = "Gazete Oluştur",
                    job = Config.WeazelJob,
                },
            },
            distance = 3.5
        })
    end
end

RegisterNetEvent("gct-news:client:buyNew", function()
    TriggerServerEvent("gct-news:server:buyNew")
end)

RegisterNetEvent("gct-news:client:createPaper", function()
    local menu = {
    {
        header = "Weazel News",
        isMenuHeader = true
    }, 
    {
        header = "Gazete Yükle",
        txt = "URL ile gazete oluştur",
        params = {
            event = "gct-news:client:uploadPaper"
        }
    }}

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("gct-news:client:uploadPaper", function()
    local dialog2 = exports['qb-input']:ShowInput({
        header = "URL Gir",
        submitText = "Onayla",
        inputs = {{
            text = "URL", -- text you want to be displayed as a place holder
            name = "url", -- name of the input should be unique otherwise it might override
            type = "text", -- type of the input
            isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
        }}
    })

    if dialog2 ~= nil and (dialog2.amount ~= 0 or dialog2.amount ~= nil) then
        TriggerServerEvent("gct-news:server:uploadNews", dialog2.url)
    end
end)

RegisterNetEvent("gct-news:client:openNews", function(url)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        url = url
    })
end)

RegisterNUICallback('ClosePaper', function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoad', function()
    createWeazel()
    createPosts()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        createWeazel()
        createPosts()
    end
end)