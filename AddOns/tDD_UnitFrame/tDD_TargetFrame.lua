local function tTargetFrame()
   
   --TargetName
   TargetFrame.nameBackground:Hide()
   

   
   --TargetTexture
	if UnitClassification("target") == "normal" then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_target")
	elseif UnitClassification("target") == "worldboss" then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_boss")
	elseif UnitClassification("target") == "elite" then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_elite")
	elseif UnitClassification("target") == "rare" or UnitClassification("target") == "rareelite"  then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_rare_elite")
	else
		TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_target")
	end
	TargetFrameTextureFrameTexture:SetTexCoord(1,0,0,1)
	TargetFrameTextureFrameTexture:ClearAllPoints()
	TargetFrameTextureFrameTexture:SetPoint("CENTER")
   --TargetBackground
	TargetFrameBackground:Hide()
	TargetFrameBackground:Show()
	TargetFrameBackground:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
	TargetFrameBackground:SetTexCoord(1,0,0,1)
	TargetFrameBackground:SetAllPoints(TargetFrameTextureFrameTexture)
	--TargetText
	TargetFrame.deadText:ClearAllPoints()
	TargetFrame.deadText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 0)
	TargetFrameTextureFrameName:ClearAllPoints()
   TargetFrameTextureFrameName:SetPoint("BOTTOMRIGHT", TargetFrame, "TOP", 0, -20)
   
   --TargetHealthBar
   TargetFrameHealthBar:ClearAllPoints()
   TargetFrameHealthBar:SetPoint("LEFT", -30, 0)
   TargetFrameHealthBar:SetHeight(18)
   TargetFrameHealthBar:SetWidth(211)
   -- TargetFrameHealthBar.background = TargetFrameHealthBar:CreateTexture("TargetFrameHealthBarBackground", "BACKGROUND")
   -- TargetFrameHealthBar.background:SetTexture(0, 0, 0, 0.5)
   -- TargetFrameHealthBar.background:SetAllPoints()
   TargetFrameTextureFrameHealthBarText:ClearAllPoints()
   TargetFrameTextureFrameHealthBarText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 0)
   --TargetManaBar
   TargetFrameManaBar:ClearAllPoints()
   TargetFrameManaBar:SetPoint("LEFT", -18, -18)
   TargetFrameManaBar:SetHeight(10)
   TargetFrameManaBar:SetWidth(189)
   -- TargetFrameManaBar.background = TargetFrameManaBar:CreateTexture("TargetFrameManaBarBackground", "BACKGROUND")
   -- TargetFrameManaBar.background:SetTexture(0, 0, 0, 0.5)
   -- TargetFrameManaBar.background:SetAllPoints()
   TargetFrameTextureFrameManaBarText:ClearAllPoints()
   TargetFrameTextureFrameManaBarText:SetPoint("CENTER", TargetFrameManaBar, "CENTER", 0, 0)
   TargetFrame.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 75, -22)
   --BarTextrue
   local mtindex = getmetatable(CreateFrame("StatusBar")).__index
   local mySetTexture = mtindex.SetStatusBarTexture
   local mySetTextureColor = mtindex.SetStatusBarColor
   
   mySetTexture(TargetFrameManaBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel")
   mySetTexture(TargetFrameHealthBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel" )
   mySetTextureColor(TargetFrameHealthBar,0.5,0.8,0.3,1)
  -- mySetTextureColor(TargetFrameManaBar,1,1,1,1)
   --TargetIcon
	local x={TargetFrame:GetRegions()}

	x[4]:ClearAllPoints()
	x[4]:SetWidth(80)
	x[4]:SetHeight(80)
	x[4]:SetPoint("RIGHT",30,5)
	ComboPoint1:ClearAllPoints()
	ComboPoint1:SetPoint("RIGHT",70,15)
	ComboPoint1:SetScale(1.4)
	ComboPoint2:SetScale(1.4)
	ComboPoint3:SetScale(1.4)
	ComboPoint4:SetScale(1.4)
	ComboPoint5:SetScale(2)
	TargetFrameTextureFramePVPIcon:ClearAllPoints()
	TargetFrameTextureFramePVPIcon:SetPoint("RIGHT",0,-10)


end

hooksecurefunc("TargetFrame_Update",tTargetFrame)

local function tTargetThreat(self, forceNormalTexture)
   self.threatIndicator:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
   self.threatIndicator:SetTexCoord(1, 0, 0, 1);
--   self.threatIndicator:SetVertexColor(1.1, 0.1, 0.1, 1);
   
   self.threatIndicator:SetAllPoints(TargetFrameBackground)
end

hooksecurefunc("TargetFrame_CheckClassification", tTargetThreat)


local function tLevel(self)
   self.levelText:SetFont('Interface\\AddOns\\tDD_UnitFrame\\edo.ttf', 12, 'THINOUTLINE')
   self.levelText:ClearAllPoints()
   self.levelText:SetPoint("RIGHT",47,-20)
end

hooksecurefunc("TargetFrame_CheckLevel", tLevel)

local function t_auras()
	if TargetFrameBuff1 ~= nil then
		TargetFrameBuff1:ClearAllPoints()
		TargetFrameBuff1:SetPoint("BOTTOMLEFT", 0,-5)
		
	end
	if TargetFrameDebuff1 ~= nil then
		TargetFrameDebuff1:ClearAllPoints()
		TargetFrameDebuff1:SetPoint("BOTTOMLEFT", 0,-45)
	end
	
	for i = 1,40 do
   if _G["TargetFrameDebuff"..i.."Icon"] ~= nil then
      local caster = select(8,UnitDebuff("target",i))     
      if caster ~= "player" then
         _G["TargetFrameDebuff"..i.."Icon"]:SetVertexColor(0.17,0.17,0.17,1)
      else
         _G["TargetFrameDebuff"..i.."Icon"]:SetVertexColor(1,1,1,1)
      end
      
   else
      break
   end
   
end

	
end
hooksecurefunc("TargetFrame_UpdateAuras", t_auras)

-- local c = CreateFrame( "frame", nil,UIParent);
-- c:RegisterEvent("PLAYER_TARGET_CHANGED")
-- c:RegisterEvent("CVAR_UPDATE")
-- c:SetScript('OnEvent',
   -- function()
		-- tTargetFrame()
   -- end
-- )


