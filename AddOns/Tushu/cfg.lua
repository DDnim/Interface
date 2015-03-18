local function print_my_bind_key(key_str)
	print("|cffffff00["..key_str.."]|r is binding to |cffffff00["..GetBindingAction(key_str).."]|r");
end

function my_bind_key()
	print_my_bind_key("F5");
	print_my_bind_key("F3");
	print_my_bind_key("F4");
	print_my_bind_key("F7");
	print_my_bind_key("F8");
	print_my_bind_key("CTRL-x");
end

--hide clock
--[[
for i=1, 12 do
	local button1 = _G["MultiBarLeftButton"..i]
	local button2 = _G["MultiBarRightButton"..i]
	button1:Hide()
	button2:Hide()
end

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
		button:SetScale(1.08)
		button:ClearAllPoints()
		if i == 1 then
			button:SetPoint("BOTTOMRIGHT", "UIParent","BOTTOMRIGHT", -347, 178)
		else
			local previous = _G["ActionButton"..i-1]
			button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
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
	  button:SetPoint("TOPLEFT", UIParent,"BOTTOM", -183.5, 48)
	else
	  local previous = _G["MultiBarBottomLeftButton"..i-1]
	  if i == (num/2+1) then
		previous = _G["MultiBarBottomLeftButton1"]
		button:SetPoint("BOTTOM", previous, "TOP", 0, 5)
	  else
		button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
	  end
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
      button:SetPoint("TOPLEFT", UIParent,"BOTTOM",2, 48)
    else
      local previous = _G["MultiBarBottomRightButton"..i-1]
      if i == (num/2+1) then
        previous = _G["MultiBarBottomRightButton1"]
        button:SetPoint("BOTTOM", previous, "TOP", 0, 5)
      else
        button:SetPoint("LEFT", previous, "RIGHT", 5, 0)
      end
    end
  end
  
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
  
--[[
Minimap:EnableMouse(true)
	Minimap:ClearAllPoints()
	Minimap:SetPoint('TOPRIGHT', UIParent, 'TOPRIGHT', -5, -5)
	Minimap:SetMaskTexture('Interface\\AddOns\\ConceptionUI miniMap\\mask.tga')
	
	Minimap.Overlay = Minimap:CreateTexture(nil, 'BORDER')
	Minimap.Overlay:SetPoint('TOPLEFT', Minimap, 'TOPLEFT', -1, 1)
	Minimap.Overlay:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMRIGHT', 1, -1)
	Minimap.Overlay:SetTexture('Interface\\AddOns\\ConceptionUI miniMap\\overlay.tga')
	Minimap.Overlay:SetVertexColor(0, 0, 0, 1)
	
	Minimap.Background = Minimap:CreateTexture(nil, 'BACKGROUND')
	Minimap.Background:SetPoint('TOPLEFT', Minimap, 'TOPLEFT', 0, 0)
	Minimap.Background:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMRIGHT', 4, 0)
	Minimap.Background:SetTexture('Interface\\AddOns\\ConceptionUI miniMap\\background.tga')
	Minimap.Background:SetVertexColor(0, 0, 0, 1)

local Tushu_panel = CreateFrame('frame', nil, UIParent)
Tushu_panel:SetSize(48,48)
Tushu_panel:SetPoint('BOTTOM', UIParent, 0, 900)
Tushu_panel.Texture = Tushu_panel:CreateTexture(nil, 'OVERLAY')
Tushu_panel.Texture:SetSize(48,48)
Tushu_panel.Texture:SetPoint('BOTTOM', UIParent, 0, 900)
Tushu_panel.Texture:SetTexture('Interface\\AddOns\\Tushu\\mask.tga')
Tushu_panel.Texture:SetVertexColor(0, 0, 0, 1)
]]--
--[[Minimap.Difficulty.Texture = Minimap.Difficulty:CreateTexture(nil, 'OVERLAY')

Minimap.Difficulty.Texture:SetAllPoints(true)
	Minimap.Difficulty.Texture:SetTexture('Interface\\AddOns\\ConceptionUI miniMap\\difficulty.tga')
Minimap.Background:SetPoint('TOPLEFT', Minimap, 'TOPLEFT', 0, 0)

Minimap.Background:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMRIGHT', 4, 0)

Minimap.Background:SetTexture('Interface\\AddOns\\ConceptionUI miniMap\\background.tga')
	Minimap.Background:SetVertexColor(0, 0, 0, 1)]]--
