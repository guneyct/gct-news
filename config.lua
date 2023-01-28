Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add 'setr UseTarget true' to use this and just that from true to false or the other way around)

Config.NewspaperItem = "newspaper"
Config.NewspaperPrice = 10
Config.WeazelJob = "reporter"

Config.PropModels = { -- add prop models you want to buy from
    'prop_news_disp_02a',
    'prop_news_disp_01a',
    'prop_news_disp_03a'
}