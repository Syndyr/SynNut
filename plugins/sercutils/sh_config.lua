sercut = sercut or {}

-- Turns on the fix for my PMC models(For DarkFraction or other ARP type gamemodes)
sercut.pmcfix = 1


-- Turns 'Flagger' on or off.
sercut.flagger = 1


-- Your SteamID
sercut.ownerSid = "STEAM_0:0:xxxxxxxx"


-- Enable the update mode, only run this when making changes to the groups and then disable it.
/*
	This will delete everything from the table stored on my system under your authID
	or make a new table under your authID and then populate it either way.
*/
sercut.flaggerUpdateMode = 1


-- Turns the 'Drill sergeant CP' on or off(For DarkFraction or other ARP type gamemodes)
sercut.dsgtCP = 1


-- For the auto flagger thingy, on the forum/site what comes before the users ID.
sercut.flagger_userprefix = "http://darkfraction.net/index.php?/user/"


-- The example image that shows if you do 
sercut.flagger_exampleimage = "ns/serc/example.png"


-- Where's script I'll be using to validate users?
sercut.flagger_validater = "http://www.serconker.felthatters.net/ns/flaggervalidater.php"
--sercut.flagger_validater = "www.google.com"


-- Your communities site (Only needed if using my personal validator)
sercut.flagger_comurl = "http://darkfraction.net/"


-- Auth for the comurl, used when creating or editing the community profile on my auth systems.
sercut.flagger_authid = "serc82"


-- The method to use when requesting.
/*
	0 = 'ValidatorURL?meth=0&comurl='..comurl..'&sid='..sid(SteamID, if you're using SteamIDs on your site instead, but you'll need another DB or such for storing what those IDs own.
	1 = 'ValidatorURL?meth=1&comurl='..comurl..'&uid='..uid(The inputted accountID)
	2 = Custom, code it your self.
	3 = Updating stuff, don't set this, set sercut.flaggerUpdateMode = 1.
	
	
	Just to clear up why I don't just locally ping the site a phase data there so you don't have to download the page every time someone clicks the validate button.
	If you want to do it locally, use option two and code it in your self.
*/
sercut.flagger_method = 1


-- Above, only applies if you're using '2'.
sercut.flagger_customauthurl = "http://derpythemalemare.com"


/*
	The groups, what to phase them by, what flags they get, items, money and models.
	'class name', 'something to identify it on the page', 'what fags to give', 'any weapons?', <How many uses per char, 0 if you only want it to be used only ever once> 'any money', <How many uses per char, 0 if you only want it to be used only ever once>, 'models and such'
	The defining string shouldn't have '||', '(*^)', '(^^)', '(**)' or '(^*)' as strings are sent between your server and my auth server when running in update mode containing all the groups details, this gets stored as is then exploded and such(Note the auth server only uses the classname and identifier string to phase stuff)	
*/
sercut.flagger_groups = {
	{"arp_bron",'">ARP Bronze</', 'pe','weapon_pistol', 1, '1000', 1, models = {{'derp.mdl'},{'derpy.mdl'}}},
	{"arp_silv",'">ARP Silver</', 'pe','weapon_pistol', 1, '1000', 1, models = {{'derp.mdl'},{'derpy.mdl'}}},
	{"arp_gold",'">ARP Gold</', 'pe','weapon_pistol', 1, '1000', 1, models = {{'derp.mdl'},{'derpy.mdl'}}},
	{"arp_plat",'">ARP Platinum</', 'pe','weapon_pistol', 1, '1000', 1, models = {{'derp.mdl'},{'derpy.mdl'}}}
}