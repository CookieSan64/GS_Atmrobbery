--assert(GetCurrentResourceName() == "GS_Atmrobbery", _U('license')) -- Ne diraj te // Do not touch¸

RegisterNetEvent('GS_Atmrobbery:notUsingBlips', function ()
    --print(_U("noblips"))
end)

RegisterNetEvent('GS_Atmrobbery:fs', function ()
    local igrac = ESX.GetPlayerFromId(source)

    local amount = math.random(Config.DobitakMin, Config.DobitakMax) -- Générer un montant aléatoire entre DobitakMin et DobitakMax
    igrac.addInventoryItem('moneywad', amount) -- Ajouter le montant aléatoire d'argent au joueur
    discordlogs("GS ATMROBBERY » Log", "[" .. igrac.identifier .. "] [" .. GetPlayerName(igrac.source) .. "] a cambriolé l'ATM' et a gagné : " .. amount .. " Liasse d'argent")
end)

-- et a obtenu un temps de recharge de : " .. Config.Cooldown .. " secondes
RegisterNetEvent('GS_Atmrobbery:at', function ()
    local igrac = ESX.GetPlayerFromId(source)

    igrac.addInventoryItem(Config.HackingDevice)
    igrac.removeMoney(Config.CenaTableta)
end)

ESX.RegisterServerCallback('GS_Atmrobbery:tabletChecker', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local stvar = Config.HackingDevice

    if xPlayer.getInventoryItem(stvar).count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('GS_Atmrobbery:moneyChecker', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local potrebno = Config.CenaTableta
    if xPlayer.getInventoryItem('black_money').count >= potrebno then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('GS_Atmrobbery:robbedAtm', function ()
    local igrac = ESX.GetPlayerFromId(source)
    local stvar = Config.HackingDevice

    --igrac.removeInventoryItem(stvar, 1)
end)

RegisterNetEvent('GS_Atmrobbery:zvanjePolicije', function (kordinate)
    local data = {displayCode = '10-64', description = _U('alertd'), isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = _U('atm')}
    local dispatchData = {dispatchData = data, caller = 'Alarm', coords = kordinate}
    TriggerEvent('wf-alerts:svNotify', dispatchData)
end)

function discordlogs(name, message)
    local vreme = os.date("*t")
    local poruka = {
        {
            ["color"] = 2061822,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"]= "Vreme: " .. vreme.hour .. ":" .. vreme.min .. ":" .. vreme.sec, -- Time
            },
        }
      }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.LogHeader, embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end