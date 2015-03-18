local function t_update()
	for i = 1,4 do
	   
	--   _G["PartyMemberFrame"..i]:SetScale(1.2)
	   x = {_G["PartyMemberFrame"..i]:GetRegions()}
	   x[2]:SetWidth(28)
	   x[2]:SetHeight(28)
	   x[2]:ClearAllPoints()
	   x[2]:SetPoint("LEFT",27,-10)
	   _G["PartyMemberFrame"..i.."Texture"]:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\party_party")
	   _G["PartyMemberFrame"..i.."Texture"]:SetTexCoord(0,1,1,0)
	   
	   _G["PartyMemberFrame"..i.."HealthBar"]:ClearAllPoints()
	   _G["PartyMemberFrame"..i.."HealthBar"]:SetPoint("LEFT",56,2)
	   _G["PartyMemberFrame"..i.."HealthBar"]:SetWidth(44)
	   _G["PartyMemberFrame"..i.."ManaBarText"]:ClearAllPoints()
	   _G["PartyMemberFrame"..i.."ManaBarText"]:SetPoint("CENTER",_G["PartyMemberFrame"..i.."HealthBar"],"CENTER",0,0)
	   _G["PartyMemberFrame"..i.."ManaBar"]:ClearAllPoints()
	   _G["PartyMemberFrame"..i.."ManaBar"]:SetPoint("LEFT",56,-9)
	   _G["PartyMemberFrame"..i.."ManaBar"]:SetWidth(44)
	   _G["PartyMemberFrame"..i.."Background"]:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\party_bg")
	   _G["PartyMemberFrame"..i.."Background"]:SetTexCoord(0,1,1,0)
	   _G["PartyMemberFrame"..i.."Background"]:SetAllPoints(_G["PartyMemberFrame"..i.."Texture"])
	   _G["PartyMemberFrame"..i.."Name"]:ClearAllPoints()
	   _G["PartyMemberFrame"..i.."Name"]:SetPoint("BOTTOM",_G["PartyMemberFrame"..i.."BOTTOM"],15,0)
	   
	end
end
hooksecurefunc("PartyMemberFrame_OnEvent", t_update)

