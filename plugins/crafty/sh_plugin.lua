local PLUGIN = PLUGIN
PLUGIN.name = "Crafty"
PLUGIN.author = "Serconker"
PLUGIN.desc = "Provides ability to craft items"
nut.util.Include("cl_derma.lua")
Crafty = Crafty or {}
function crafyFindUsableRecipies(Inventory, ply)
	print(1)
	PrintTable(Inventory)
	local Cont = 0
	if(table.Count(Inventory)!=0 or nil)then
		for I=1,table.Count(Crafty.Recipies),1 do
			print(2)
			if(table.Count(Crafty.Recipies[I]["Needs"]) != 1 or 0)then
				print(3)
				print(table.Count(Crafty.Recipies[I]["Needs"]))
				PrintTable(Crafty.Recipies[I]["Needs"])
				print("Mag!")
				for X=1,table.Count(Crafty.Recipies[I]["Needs"]),1 do
					print(4)
					for Y=1,table.Count(Inventory),1 do
						print(5)
						print(Crafty.Recipies[I]["Needs"][X])
						print(Inventory[Y])
						if(Crafty.Recipies[I]["Needs"][X]==Inventory[Y])then
							print(6)
							local Cont = Cont+1
						end
						if(Y==table.Count(Inventory))then
							local Cont = 0
						end
					end
					if (X == table.Count(Crafty.Recipies[I]["Needs"]) && Cont == table.Count(Crafty.Recipies[I]["Needs"]))then
						print(7)
					end
				end
			else
				for X=1,table.Count(Inventory),1 do
					print(8)
					print(X)
					if(Inventory[X]==Crafty.Recipies[I]["Needs"][X])then
						print(9)
						Crafty.InventoryBuff[ply:Name()][table.Count(Crafty.InventoryBuff[ply:Name()])+1]=Crafty.Recipies[I]["Name"].."|"..Crafty.Recipies[I]
						print(Crafty.InventoryBuff[ply:Name()][table.Count(Crafty.InventoryBuff[ply:Name()])])
					end
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
		Needs  = {"water_special"},
		Need   = {1,},
		Prod   = {"Shiv"},
		Amount = {1}
	}
}