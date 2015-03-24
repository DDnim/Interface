-- MyStatusBar = CreateFrame("StatusBar", nil, UIParent)
-- MyStatusBar:SetStatusBarTexture("Interface\\AddOns\\Tushu\\castbar")
-- MyStatusBar:GetStatusBarTexture():SetHorizTile(false)
-- MyStatusBar:SetMinMaxValues(0, 100)
-- MyStatusBar:SetValue(100)
-- MyStatusBar:SetWidth(128*2)
-- MyStatusBar:SetHeight(32*2)
-- MyStatusBar:SetPoint("CENTER",UIParent,"CENTER")
-- MyStatusBar:SetStatusBarColor(0,1,0)
-- CastingBarFrame:SetStatusBarTexture("Interface\AddOns\Tushu\castbar")

local mediapath = "Interface\\AddOns\\tBar\\" 


DDbarf3 = DDbarf3 or CreateFrame("Frame","rABS_Bar2Holder", MultiBarBottomLeft)
DDbarf3:SetFrameStrata("BACKGROUND")
DDbarf3:SetFrameLevel(7)
DDbarf3:SetWidth(1024)
DDbarf3:SetHeight(256)
DDbarf3:SetPoint("BOTTOM", UIParent,-1,-55)
DDbarf3:Show()
DDbarf3:SetScale(0.9)
local DDbart3 = DDbarf3:CreateTexture(nil,"OVERLAY")
DDbart3:SetTexture( mediapath .. "BottomLeftBar")
DDbart3:SetAllPoints(DDbarf3)	



DDbarf4 = DDbarf4 or CreateFrame("Frame","rABS_Bar3Holder",MultiBarBottomRight)
DDbarf4:SetFrameStrata("BACKGROUND")
DDbarf4:SetFrameLevel(8)


DDbarf4:SetWidth(1024)
DDbarf4:SetHeight(128)
DDbarf4:SetPoint("BOTTOM",UIParent,0,-20)
DDbarf4:Show()
DDbarf4:SetScale(0.9 )
DDbart4 = DDbart4  or DDbarf4:CreateTexture(nil,"BACKGROUND")
DDbart4:SetTexture(mediapath .. "BottomRightBar" )
DDbart4:SetAllPoints(DDbarf4)



DDbarf = DDbarf or CreateFrame("Frame","rABS_Bar1Holder",ActionBarFrame)
DDbarf:SetFrameStrata("BACKGROUND")
DDbarf:SetFrameLevel(6)
DDbarf:SetWidth(1024)
DDbarf:SetHeight(128)
DDbarf:SetPoint("BOTTOM",UIParent,-3,60)
DDbarf:Show()
DDbarf:SetScale(0.7)
local DDbart = DDbarf:CreateTexture(nil,"BACKGROUND")
DDbart:SetTexture( mediapath .. "BottomRightBar")
DDbart:SetAllPoints(DDbarf)