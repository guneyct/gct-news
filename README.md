## GCT Newspaper

This script allows you to upload a newspaper and with item you can read it in game!

https://discord.gg/PHBX53jcSn

## DEPENDENCIES

[qb-core](https://github.com/qbcore-framework/qb-core)
[qb-target](https://github.com/qbcore-framework/qb-target)

## QB-CORE ITEMS IMPLENTATION

```lua

	["newspaper"] 					 	= {["name"] = "newspaper", 			  	  	["label"] = "Gazete", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "newspaper.png", 			["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true, ["rare"] = false,   ["combinable"] = nil,   ["description"] = "Weazel News tarafından posta kutularına atılan gazete (okumak güzeldir)."},
    
```
After that add this to your **qb-inventory/hmtl/js/app.js**
```javascript

	else if (itemData.name == "newspaper") { // change the item name to your item name
        $(".item-info-title").html('<p>Gazete Tarihi</p>')
        $(".item-info-description").html('<p>Tarih: ' + itemData.info.date + '</p>');
	}

```

## IMPORTANT

Don't forget to edit **config.lua**
Don't forget to run the **news.sql** to work properly