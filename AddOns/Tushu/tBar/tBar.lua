	local blizzHider = CreateFrame("Frame","rABS_BizzardHider")
	blizzHider:Hide()
	MainMenuBar:SetParent(blizzHider)
		ActionBarDownButton:SetParent(blizzHider)
		ActionBarUpButton:SetParent(blizzHider)
	OverrideActionBarExpBar:SetParent(blizzHider)
		OverrideActionBarHealthBar:SetParent(blizzHider)
		OverrideActionBarPowerBar:SetParent(blizzHider)
		OverrideActionBarPitchFrame:SetParent(blizzHider) --maybe we can use that frame later for pitchig and such

	MainMenuBarTexture0:SetTexture(nil)
		MainMenuBarTexture1:SetTexture(nil)
		MainMenuBarTexture2:SetTexture(nil)
		MainMenuBarTexture3:SetTexture(nil)
	MainMenuBarLeftEndCap:SetTexture(nil)
	MainMenuBarRightEndCap:SetTexture(nil)
	
	StanceBarLeft:SetTexture(nil)
	StanceBarMiddle:SetTexture(nil)
	StanceBarRight:SetTexture(nil)
	SlidingActionBarTexture0:SetTexture(nil)
	SlidingActionBarTexture1:SetTexture(nil)
	PossessBackground1:SetTexture(nil)
	PossessBackground2:SetTexture(nil)
	
--bar1
	MainMenuBarArtFrame:SetParent(UIParent)
	local num = 12
	local buttonList = {}
	for i=1, num do
		local button = _G["ActionButton"..i]
		table.insert(buttonList, button) --add the button object to the list
		button:SetSize(26, 26)
		button:SetScale(1.4)
		button:ClearAllPoints()
		if i == 1 then
			button:SetPoint("BOTTOM", "UIParent","BOTTOM", -163, 74)
		else
			local previous = _G["ActionButton"..i-1]
			button:SetPoint("LEFT", previous, "RIGHT", 3, 0)
		end
	end

--bar2
	MultiBarBottomLeft:SetParent(UIParent)
	for i=1, num do
	local button = _G["MultiBarBottomLeftButton"..i]
	table.insert(buttonList, button) --add the button object to the list
	button:SetSize(26, 26)
	button:SetScale(1.2)
	button:ClearAllPoints()
	if i == 1 then
	  button:SetPoint("BOTTOM", UIParent,"BOTTOM", -170, 53)
	else
	  local previous = _G["MultiBarBottomLeftButton"..i-1]
	  button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
	end
  end
  
--bar3
	MultiBarBottomRight:SetParent(UIParent)
	for i=1, num do
    local button = _G["MultiBarBottomRightButton"..i]
    table.insert(buttonList, button) --add the button object to the list
    button:SetSize(26, 26)
	button:SetScale(1.2)
    button:ClearAllPoints()
    if i == 1 then
      button:SetPoint("BOTTOM", UIParent,"BOTTOM",-170, 23)
    else
      local previous = _G["MultiBarBottomRightButton"..i-1]
      button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
    end
  end
  
	MultiBarRightButton12:ClearAllPoints()
MultiBarRightButton12:SetScale(1.43)
MultiBarRightButton12:SetPoint("BOTTOM",UIParent,'BOTTOM',-195,35)
	MultiBarRightButton11:ClearAllPoints()

MultiBarRightButton11:SetScale(1.43)
MultiBarRightButton11:SetPoint("BOTTOM",UIParent,'BOTTOM',195,35)
  --[[
--bar4
	MultiBarRight:SetParent(UIParent)
	for i=1, num do
    local button = _G["MultiBarRightButton"..i]
    table.insert(buttonList, button) --add the button object to the list
    button:SetSize(26, 26)
	button:SetScale(1.2)
    button:ClearAllPoints()
    if i == 1 then
		 button:SetPoint("TOPLEFT", UIParent,"BOTTOM",196.5, 48)
	elseif i == 7 then
		button:SetSize(64, 64)
		button:SetPoint("TOP", UIParent, "BOTTOM", -68, 225)
	elseif i == 8 then
		button:SetSize(64, 64)
		button:SetPoint("LEFT", MultiBarRightButton7, "RIGHT", 26*2 + 5*3, 0)
	elseif i == 9 then
		button:SetPoint("BOTTOMLEFT", MultiBarRightButton7, "RIGHT", 5, 5)
	elseif i == 10 then
		button:SetPoint("BOTTOMRIGHT", MultiBarRightButton8, "LEFT", -5, 5)
	elseif i == 11 then
		button:SetPoint("TOPLEFT", MultiBarRightButton7, "RIGHT", 5, -5)
	elseif i == 12 then
		button:SetPoint("TOPRIGHT", MultiBarRightButton8, "LEFT", -5, -5)
    else
		local previous = _G["MultiBarRightButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
    end
  end
  
--bar5
	MultiBarLeft:SetParent(UIParent)
	for i=1, num do
		local button = _G["MultiBarLeftButton"..i]
		table.insert(buttonList, button) --add the button object to the list
		button:SetSize(26, 26)
		button:SetScale(1.2)
		button:ClearAllPoints()
		if i == 1 then
		 button:SetPoint("TOPLEFT", UIParent,"BOTTOM",-377.5, 48)
		elseif i == 7 then
		button:SetPoint("BOTTOM", MultiBarLeftButton1, "TOP", 0, 5)
		else
		local previous = _G["MultiBarLeftButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
		end
	end
  
]]--  