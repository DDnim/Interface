local function tFocusFrame(self)
   
   --TargetName
   FocusFrame.nameBackground:Hide()
   

   
   --TargetTexture
	if UnitClassification("target") == "normal" then
		FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_target")
	elseif UnitClassification("target") == "worldboss" then
		FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_boss")
	elseif UnitClassification("target") == "elite" then
		FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_elite")
	elseif UnitClassification("target") == "rare" or UnitClassification("target") == "rareelite"  then
		FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_rare_elite")
	else
		FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_target")
	end
	FocusFrameTextureFrameTexture:SetTexCoord(1,0,0,1)
	FocusFrameTextureFrameTexture:ClearAllPoints()
	FocusFrameTextureFrameTexture:SetPoint("CENTER")
   --TargetBackground
	FocusFrameBackground:Hide()
	FocusFrameBackground:Show()
	FocusFrameBackground:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
	FocusFrameBackground:SetTexCoord(1,0,0,1)
	FocusFrameBackground:SetAllPoints(FocusFrameTextureFrameTexture)
	--TargetText
	FocusFrame.deadText:ClearAllPoints()
	FocusFrame.deadText:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 0)
	FocusFrameTextureFrameName:ClearAllPoints()
   FocusFrameTextureFrameName:SetPoint("BOTTOMRIGHT", FocusFrame, "TOP", 0, -20)
   
   --TargetHealthBar
   FocusFrameHealthBar:ClearAllPoints()
   FocusFrameHealthBar:SetPoint("LEFT", -30, 0)
   FocusFrameHealthBar:SetHeight(18)
   FocusFrameHealthBar:SetWidth(211)
   -- FocusFrameHealthBar.background = FocusFrameHealthBar:CreateTexture("FocusFrameHealthBarBackground", "BACKGROUND")
   -- FocusFrameHealthBar.background:SetTexture(0, 0, 0, 0.5)
   -- FocusFrameHealthBar.background:SetAllPoints()
   FocusFrameTextureFrameHealthBarText:ClearAllPoints()
   FocusFrameTextureFrameHealthBarText:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 0)
   --TargetManaBar
   FocusFrameManaBar:ClearAllPoints()
   FocusFrameManaBar:SetPoint("LEFT", -18, -18)
   FocusFrameManaBar:SetHeight(10)
   FocusFrameManaBar:SetWidth(189)
   -- FocusFrameManaBar.background = FocusFrameManaBar:CreateTexture("FocusFrameManaBarBackground", "BACKGROUND")
   -- FocusFrameManaBar.background:SetTexture(0, 0, 0, 0.5)
   -- FocusFrameManaBar.background:SetAllPoints()
   FocusFrameTextureFrameManaBarText:ClearAllPoints()
   FocusFrameTextureFrameManaBarText:SetPoint("CENTER", FocusFrameManaBar, "CENTER", 0, 0)
   FocusFrame.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 75, -22)
   --BarTextrue
   local mtindex = getmetatable(CreateFrame("StatusBar")).__index
   local mySetTexture = mtindex.SetStatusBarTexture
   local mySetTextureColor = mtindex.SetStatusBarColor
   
   mySetTexture(FocusFrameManaBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel")
   mySetTexture(FocusFrameHealthBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel" )
   mySetTextureColor(FocusFrameHealthBar,0.5,0.8,0.3,1)
   --mySetTextureColor(FocusFrameManaBar,1,1,1,1)
   --TargetIcon
	local x={FocusFrame:GetRegions()}

	x[4]:ClearAllPoints()
	x[4]:SetWidth(80)
	x[4]:SetHeight(80)
	x[4]:SetPoint("RIGHT",30,5)
	ComboPoint1:ClearAllPoints()
	ComboPoint1:SetPoint("RIGHT",45,15)
	ComboPoint5:SetScale(1.4)
	FocusFrameTextureFramePVPIcon:ClearAllPoints()
	FocusFrameTextureFramePVPIcon:SetPoint("RIGHT",0,-10)


end










local function tFocusThreat(self, forceNormalTexture)
   self.threatIndicator:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
   self.threatIndicator:SetTexCoord(1, 0, 0, 1);
   --self.threatIndicator:SetVertexColor(1.1, 0.1, 0.1, 1);
   
   self.threatIndicator:SetAllPoints(FocusFrameBackground)
end




local function tLevel(self)
   self.levelText:SetFont('Interface\\AddOns\\tDD_UnitFrame\\edo.ttf', 12, 'THINOUTLINE')
   self.levelText:ClearAllPoints()
   self.levelText:SetPoint("RIGHT",47,-20)
end



local function t_auras()
	if FocusFrameBuff1 ~= nil then
		FocusFrameBuff1:ClearAllPoints()
		FocusFrameBuff1:SetPoint("BOTTOMLEFT", 0,-5)
		FocusFrameBuff1.SetPoint = function() end
	end
	if TargetFrameDebuff1 ~= nil then
		FocusFrameDebuff1:ClearAllPoints()
		FocusFrameDebuff1:SetPoint("BOTTOMLEFT", 0,-45)
		FocusFrameDebuff1.SetPoint = function() end
	end
end


local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_FOCUS_CHANGED")

c:SetScript('OnEvent',
 function(self,event)
	if event == "PLAYER_FOCUS_CHANGED" then
		tFocusFrame()
		-- hooksecurefunc("FocusFrame_CheckClassification", tFocusThreat)
		-- hooksecurefunc("FocusFrame_CheckLevel", tLevel)
		t_auras()
	end
end
 )



-- local c = CreateFrame( "frame", nil,UIParent);
-- c:RegisterEvent("PLAYER_TARGET_CHANGED")
-- c:RegisterEvent("CVAR_UPDATE")
-- c:SetScript('OnEvent',
   -- function()
		-- tFocusFrame()
   -- end
-- )


