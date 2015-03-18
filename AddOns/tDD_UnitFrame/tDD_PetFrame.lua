local function t_update()
local x={PetFrame:GetRegions()}
x[2]:SetWidth(28)
x[2]:SetHeight(28)
x[2]:ClearAllPoints()
x[2]:SetPoint("LEFT",24,-10)

PetFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\tot_tot")
PetFrame:SetScale(1.8)
PetFrame:ClearAllPoints()
PetFrame:SetPoint("TOPLEFT",PlayerFrame,"BOTTOMLEFT",-30,15)
PetFrameTexture:SetTexCoord(0,1,0,1)

PetFrameHealthBar:SetWidth(39)
PetFrameHealthBar:ClearAllPoints()
PetFrameHealthBar:SetPoint("LEFT",56,-8)
PetName:SetWidth(0.01)

PetFrameManaBar:Hide()
end
hooksecurefunc("PetFrame_OnEvent", t_update)
