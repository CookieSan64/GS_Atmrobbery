Config = {}

Config.Locale = 'en' -- Langue
Config.DobitakMin = 5 -- Montant minimum de moneywad que les joueurs recevront après avoir cambriolé l'ATM
Config.DobitakMax = 50 -- Montant maximum de moneywad que les joueurs recevront après avoir cambriolé l'ATM
Config.HackingDevice = 'phone' -- Nom de l'objet de piratage que les joueurs utiliseront
Config.UseDealer = false -- Voulez-vous acheter une tablette chez le revendeur ?
Config.KoristiBlipove = false -- Voulez-vous afficher un repère sur la carte pour le revendeur ?
Config.CenaTableta = 450 -- Prix de la tablette
Config.HackTime = 15 -- Durée du piratage en secondes
Config.Policija = 'police', 'fbi' -- Travail de la police
Config.Cooldown = 30 -- Temps de recharge en secondes

-- # Configuration du webhook
Config.LogHeader = "GS ATMROBBERY » Log"
Config.Webhook = "https://discord.com/api/webhooks/1091027409014378596/U7TbxA6ZP3iNSi7d5sUaYgBYPoLqXeMHF6xm2r58YGvFlmrapfllfS-jbs8c70uzB7Wa" -- Webhook Discord
-------------------------------------------------------

Config.Diler = { -- Revendeur
    {
        --coords = vector4(1330.8220, -608.2700, 74.5080, 142.1377),
        --model = "a_m_m_og_boss_01",
    }
}

Config.Blipovi = {
    {
        Ime = "Revendeur", -- Nom du repère
        Velicina = 0.6, -- Taille du repère
        Boja = 6, -- Couleur du repère
        Ikonica = 480, -- Icône du repère
        Kordinate = vector3(1330.8220, -608.2700, 74.5080), -- Coordonnées du repère
        Pokazuj = 6, -- Affichage
    }
}

Config.Propovi = {
    'prop_atm_02',
    'prop_fleeca_atm',
    'prop_atm_03',
    'prop_atm_01',
}