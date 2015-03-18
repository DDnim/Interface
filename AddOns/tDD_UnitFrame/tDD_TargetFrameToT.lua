local function t_update()
local x={TargetFrameToT:GetRegions()}
x[2]:SetWidth(28)
x[2]:SetHeight(28)
x[2]:ClearAllPoints()
x[2]:SetPoint("RIGHT",-24,0)
TargetFrameToT:SetWidth(128)
TargetFrameToT:SetHeight(64)

TargetFrameToT:SetScale(1.8)
TargetFrameToTTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\tot_tot")
TargetFrameToTTextureFrameTexture:SetHeight(64)
TargetFrameToT:ClearAllPoints()
TargetFrameToT:SetPoint("TOPRIGHT",TargetFrame,"BOTTOMRIGHT",30,15)
TargetFrameToTTextureFrameTexture:SetTexCoord(1,0,0,1)

TargetFrameToTHealthBar:SetWidth(39)
TargetFrameToTHealthBar:ClearAllPoints()
TargetFrameToTHealthBar:SetPoint("RIGHT",-56,0)
TargetFrameToTTextureFrameName:Hide()

TargetFrameToTBackground:Hide() 
TargetFrameToTManaBar:Hide()
end
hooksecurefunc("TargetofTarget_Update", t_update)
