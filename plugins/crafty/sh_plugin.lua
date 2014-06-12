local PLUGIN = PLUGIN
PLUGIN.name = "Crafty"
PLUGIN.author = "Serconker"
PLUGIN.desc = "Provides ability to craft items"
nut.util.Include("cl_derma.lua")
Crafty = Crafty or {}
function crafyFindUsableRecipies(Inventory, ply)
	local Cont = 0
	for I=1,table.Count(Crafty.Recipies),1 do
		if(table.Count(Crafty.Recipies[I]["Needs"]) != 1 or 0)then
			for X=1,table.Count(Crafty.Recipies[I]["Needs"]),1 do
				for Y=1,table.Count(Inventory),1 do
					if(Crafty.Recipies[I]["Needs"][X]==Inventory[Y])then
						local Cont = Cont+1
					end
				end
				if (X == table.Count(Crafty.Recipies[I]["Needs"]) && Cont == table.Count(Crafty.Recipies[I]["Needs"]))then
					
				end
			end
		else
			for X=1,table.Count(Inventory),1 do
				if(Inventory[X]==Crafty.Recipies[I]["Needs"][X])then
					Crafty.InventoryBuff[ply:Name()][table.Count(Crafty.InventoryBuff[ply:Name()])+1]=Crafty.Recipies[I]["Name"].."|"..Crafty.Recipies[I]
				end
			end
		end
	end
end
Crafty.Recipies = {
	{
		Name  = "Example", --Name of the recipe.
		Needs = { --What items are needed to make this?
					"Name",
					"Name"
				},
		Need  = { --How many of that item?
					1,
					3
				},
		Prod  = { --What does this give the player?
					"Name",
					"Name"
				},
		Amount= { --How many does it make?
					1,
					1
				}
	},
	{
		Name   = "Shiv",
		Needs  = {"Water"},
		Need   = {1,},
		Prod   = {"Shiv"},
		Amount = {1}
	}
}