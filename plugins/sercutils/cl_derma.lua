local PLUGIN = PLUGIN
local PANEL = {}
nut.util.Include("sh_config.lua")
sercut = sercut or {}
if(sercut.flagger==1)then
	function PANEL:Init()
		local metaPly = LocalPlayer()
		local metaData = FindMetaTable("Player")
		local cont = vgui.Create("DLabel", self)
		if(metaPly:IsAdmin() or metaPly:IsSuperAdmin())then
			local help = vgui.Create("DButton", self)
			local Te = vgui.Create("DTextEntry", self)
			self:SetPos(ScrW() * 0.375, ScrH() * 0.350)
			self:SetSize(450, 150)
			self:MakePopup()
			self:SetTitle("Flagger-Prompt")

			cont:SetPos(10, 75)
			cont:SetColor(Color(255,255,255,255))
			cont:SetFont("DermaDefaultBold")
			cont:SetText("Please enter your forum accountID here:")
			cont:SizeToContents()
			
			help:SetSize(250,15)
			help:SetPos(8,90)
			help:SetColor(Color(255,255,255,255))
			help:SetFont("DermaDefaultBold")
			help:SetText("Need help finding your accountID? Click me!")
			help.Paint   = function()
				surface.SetDrawColor(255,255,255,0)
			end
			help.DoClick = function()
				FlaggerHelp(1)		
				flaggerComSetup()
			end
			Te:SetParent(self)
			Te:SetSize(100,15)
			Te:SetPos(300,75)
			Te:SetText("I.E '135-serconker'")
		else
			self:SetPos(ScrW() * 0.375, ScrH() * 0.350)
			self:SetSize(450, 150)
			self:MakePopup()
			self:SetTitle("Prompt")
			
			cont:SetPos(100,75)
			cont:SetColor(Color(255,255,255,255))
			cont:SetFont("DermaDefaultBold")
			cont:SetText("You're an admin, you don't need to use this!")
			cont:SizeToContents()
		end
	end
	vgui.Register("serc_Flagger", PANEL, "DFrame")
	function FlaggerHelp(N)
		if(N==1)then
			local body = vgui.Create("DFrame")
			local help = vgui.Create("DImage", body)
			body:SetPos(ScrW() * 0.375, ScrH() * 0.350)
			body:SetSize(450, 150)
			body:MakePopup()
			body:SetTitle("Flagger user help")
			
			help:SetImage(sercut.flagger_exampleimage)
			help:SizeToContents()
		end
	end
	function PLUGIN:CreateMenuButtons(menu, addButton)
		addButton("serctil", "Flagger", function()
			nut.gui.mod = vgui.Create("serc_Flagger", menu)
			menu:SetCurrentMenu(nut.gui.mod)
		end)
	end
end