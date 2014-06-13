Crafty = Crafty or {}
local PLUGIN = PLUGIN
local PANEL = PANEL or {}
function PANEL:Init()
	local Butt = vgui.Create("DButton", self)
	local cItems = vgui.Create("DListView",self)
	local cTable = vgui.Create("DListView",self)
	local Left = vgui.Create("DButton",self)
	local Right = vgui.Create("DButton",self)
	local inve = LocalPlayer():GetInventory()
	local cRight = {}
	
	self:SetPos(ScrW() * 0.3, ScrH() * 0.300)
	self:SetSize(750, 450)
	self:MakePopup()
	self:SetTitle("Crafty")
	
	cItems:SetPos(10,100)
	cItems:SetSize(200,300)
	cItems:AddColumn("Inventory")
	cItems:SetMultiSelect(false)
	
	cTable:SetPos(260,100)
	cTable:SetSize(200,300)
	cTable:AddColumn("Crafting area")
	cTable:SetMultiSelect(false)
	
	Butt:SetSize(50,50)
	Butt:SetPos(0,0)
	Butt:SetColor(Color(255,255,255,255))
	Butt:SetFont("DermaDefaultBold")
	Butt:SetText("DEBUG WHORE")
	
	Left:SetSize(50,30)
	Left:SetPos(210,115)
	Left:SetColor(Color(255,255,255,255))
	Left:SetText("<<")
	Left.DoClick = function()
		local Item = cTable:GetSelectedLine()
		cItems:AddLine(cRight[Item])
		cTable:RemoveLine(Item)
		print(Crafty.inv[Item])
		print(cRight[Item])
		print("#")
		table.insert(Crafty.inv,cRight[Item])
		table.remove(cRight, Item)
		PrintTable(cRight)
		print("#")
		--crafyFindUsableRecipies(cRight, LocalPlayer())
	end
	
	
	
	Right:SetSize(50,30)
	Right:SetPos(210,160)
	Right:SetColor(Color(255,255,255,255))
	Right:SetText(">>")
	Right.DoClick = function()
		local Item = cItems:GetSelectedLine()
		cTable:AddLine(Crafty.inv[Item])
		cItems:RemoveLine(Item)
		print(Crafty.inv[Item])
		print(cRight[Item])
		print("#")
		table.insert(cRight, Crafty.inv[Item])
		table.remove(Crafty.inv, Item)
		PrintTable(cRight)
		print("#")
		--crafyFindUsableRecipies(cRight, LocalPlayer())
	end
	
	
	
	Crafty.inv = {}
	for k, v in pairs(inve) do
		Crafty.inv[table.Count(Crafty.inv)+1] = k
		cItems:AddLine(k)
	end
	
		
		
		
	Butt.DoClick = function()
		--PrintTable(inve)
		local Item = cItems:GetSelectedLine()
		local List = cRight
		print(Item)
		--crafyFindUsableRecipies(Crafty.inv, LocalPlayer())
	end
end
vgui.Register("serc_Crafty", PANEL, "DFrame")

function PLUGIN:CreateMenuButtons(menu, addButton)
	addButton("serccrafty", "Crafty", function()
		nut.gui.mod = vgui.Create("serc_Crafty", menu)
		menu:SetCurrentMenu(nut.gui.mod)
	end)
end