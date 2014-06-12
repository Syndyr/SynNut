Crafty = Crafty or {}
local PLUGIN = PLUGIN
local PANEL = PANEL or {}
function PANEL:Init()
	local Butt = vgui.Create("DButton", self)
	local Items = vgui.Create("DListView",self)
	local Table = vgui.Create("DListView",self)
	local Left = vgui.Create("DButton",self)
	local Right = vgui.Create("DButton",self)
	
	local inve = LocalPlayer():GetInventory()
	
	
	self:SetPos(ScrW() * 0.3, ScrH() * 0.300)
	self:SetSize(750, 450)
	self:MakePopup()
	self:SetTitle("Crafty")
	
	Items:SetPos(10,100)
	Items:SetSize(200,300)
	Items:AddColumn("Inventory")
	Items:SetMultiSelect(false)
	
	Table:SetPos(260,100)
	Table:SetSize(200,300)
	Table:AddColumn("Crafting area")
	Table:SetMultiSelect(false)
	
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
		local Item = Table:GetSelectedLine()
		Table:RemoveLine(Item)
		Items:AddLine(Crafty.inv[Item])
	end
	
	
	
	Right:SetSize(50,30)
	Right:SetPos(210,160)
	Right:SetColor(Color(255,255,255,255))
	Right:SetText(">>")
	Right.DoClick = function()
		local Item = Items:GetSelectedLine()
		Items:RemoveLine(Item)
		Table:AddLine(Crafty.inv[Item])
	end
	Crafty.inv = {}
	for k, v in pairs(inve) do
		Crafty.inv[table.Count(Crafty.inv)+1] = k
		Items:AddLine(k)
	end
	Butt.DoClick = function()
		PrintTable(inve)
	end
end
vgui.Register("serc_Crafty", PANEL, "DFrame")

function PLUGIN:CreateMenuButtons(menu, addButton)
	addButton("serccrafty", "Crafty", function()
		nut.gui.mod = vgui.Create("serc_Crafty", menu)
		menu:SetCurrentMenu(nut.gui.mod)
	end)
end