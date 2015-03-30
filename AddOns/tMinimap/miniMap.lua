local function StyleMap()
	local TIMER = true
	local TIMER_FONT_SIZE = 32
	
	local Minimap = Minimap

	-------Minimap

	Minimap:EnableMouse(true)

	Minimap:ClearAllPoints()

	Minimap:SetPoint('TOPRIGHT', UIParent, 'TOPRIGHT', -5, -5)

	Minimap:SetMaskTexture('Interface\\AddOns\\tMiniMap\\mask.tga')

	-------Overlay

	Minimap.Overlay = Minimap:CreateTexture(nil, 'BORDER')
	Minimap.Overlay:SetPoint('TOPLEFT', Minimap, 'TOPLEFT', -1, 1)
	Minimap.Overlay:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMRIGHT', 1, -1)
	Minimap.Overlay:SetTexture('Interface\\AddOns\\tMiniMap\\overlay.tga')
	Minimap.Overlay:SetVertexColor(0, 0, 0, 1)

	-------Background

	Minimap.Background = Minimap:CreateTexture(nil, 'BACKGROUND')
	Minimap.Background:SetPoint('TOPLEFT', Minimap, 'TOPLEFT', 0, 0)
	Minimap.Background:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMRIGHT', 4, 0)
	Minimap.Background:SetTexture('Interface\\AddOns\\tMiniMap\\background.tga')
	Minimap.Background:SetVertexColor(0, 0, 0, 1)

	-------Difficulty

	Minimap.Difficulty = CreateFrame('Frame', nil, Minimap)
	Minimap.Difficulty:SetSize(48,48)
	Minimap.Difficulty:SetPoint('TOPLEFT', Minimap, -12, 12)
	Minimap.Difficulty.Texture = Minimap.Difficulty:CreateTexture(nil, 'OVERLAY')
	Minimap.Difficulty.Texture:SetAllPoints(true)
	Minimap.Difficulty.Texture:SetTexture('Interface\\AddOns\\tMiniMap\\difficulty.tga')

	Minimap.Difficulty.Text = Minimap.Difficulty:CreateFontString(nil, 'OVERLAY')
	Minimap.Difficulty.Text:SetFont('Interface\\AddOns\\tMiniMap\\edo.ttf', 12, 'THINOUTLINE')
	Minimap.Difficulty.Text:SetPoint('CENTER')
	Minimap.Difficulty:SetAlpha(.8)

	-------difficulty function
	-------may change color of difficulty text
	-------need change the "DifficultyID" in wod

	local function OnEvent()
	  Minimap.Difficulty:Hide()
	  if not IsInInstance()  then return end
	  local _, instanceType, difficulty, _, maxPlayers, _, dynamic,_,raidmem  = GetInstanceInfo()
	  if (instanceType=='pvp') or (instanceType=='arena') then return end
	  local color, text = {}, maxPlayers..'C'
	  if instanceType == 'party' then
		 if GetChallengeMode() then 
			text = maxPlayers..'C'
			color = {0, 0, .38}
		 elseif difficulty >= 2 then
			text = maxPlayers..'H'
			color = {.38, 0, 0}
		 else
			text = maxPlayers..'N'
			color = {0, 0, 0}
		 end
	  elseif instanceType == 'raid' then
		 if difficulty == 14 or difficulty ==3 or difficulty ==4 then
			text = raidmem..'N'
			color = {.38, .38, 0}
		 elseif difficulty == 7 or difficulty ==17 then
			text = 'LFR'
			color = {.38, .38, 0}
		 elseif difficulty == 15 or difficulty ==5 or difficulty ==6 then
			text = raidmem..'H'
			color = {.38, 0, 0}
		elseif difficulty == 16 then
			text = raidmem..'M'
			color = {.78, 0, 0}
		 else
			text = maxPlayers..'E'
			color = {0, 0, 0}
		 end
	  else
		 text = raidmem..'N'
		 color = {0, 0, 0}
	  end
	  Minimap.Difficulty.Texture:SetVertexColor(unpack(color))
	  Minimap.Difficulty.Text:SetText('|cFF9E9E9E'..text..'|r')
	  Minimap.Difficulty:Show()
	end
	Minimap.Difficulty:RegisterEvent("PLAYER_DIFFICULTY_CHANGED");
	Minimap.Difficulty:RegisterEvent("INSTANCE_GROUP_SIZE_CHANGED");
	Minimap.Difficulty:RegisterEvent("UPDATE_INSTANCE_INFO");
	Minimap.Difficulty:RegisterEvent("GROUP_ROSTER_UPDATE");
	Minimap.Difficulty:RegisterEvent("PLAYER_GUILD_UPDATE");
	Minimap.Difficulty:RegisterEvent("PARTY_MEMBER_ENABLE");
	Minimap.Difficulty:RegisterEvent("PARTY_MEMBER_DISABLE");
	Minimap.Difficulty:RegisterEvent("GUILD_PARTY_STATE_UPDATED");

	Minimap.Difficulty:SetScript('OnEvent', OnEvent)

	-------MinimapMailFrame
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMRIGHT', 6, -7)
	MiniMapMailIcon:SetTexture('Interface\\MINIMAP\\TRACKING\\Mailbox')
	MiniMapMailBorder:Hide()

	-------MinimapButton
	QueueStatusMinimapButton:ClearAllPoints()
	QueueStatusMinimapButton:SetPoint('BOTTOMLEFT', Minimap, -5, -5)
	QueueStatusMinimapButton:Show()
	MiniMapRecordingButton:ClearAllPoints()
	MiniMapRecordingButton:SetPoint('BOTTOMLEFT', Minimap, -5, 5)

	-------Timer frames
	LoadAddOn('Blizzard_TimeManager')
	if TIMER then
		local timerborder,timertext,_ = TimeManagerClockButton:GetRegions()
		timerborder:Hide()
		timertext:SetFont("Interface\\AddOns\\tMiniMap\\edo.ttf", TIMER_FONT_SIZE)
		TimeManagerClockButton:Show()
	else 
		TimeManagerClockButton:Hide()
	end
	-------Hide blz's frames
	MinimapNorthTag:SetAlpha(0)
	MinimapBorder:Hide()
	MinimapBorderTop:Hide()	
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	MiniMapVoiceChatFrame:Hide()
	MiniMapWorldMapButton:Hide()
	MiniMapTracking:Hide()
	GameTimeFrame:Hide()
	MinimapZoneTextButton:Hide()
	MinimapBackdrop:SetBackdrop({})
	MiniMapInstanceDifficulty:Hide()
	MiniMapInstanceDifficulty.Show = function() end
	MiniMapChallengeMode:Hide()
	MiniMapChallengeMode.Show = function() end
	GuildInstanceDifficulty:Hide()
	GuildInstanceDifficulty.Show = function() end

	-------Map Scale/Zoom control
	local function OnMouseWheel(self, delta)
	  if IsAltKeyDown() then
		 -------Scale
		 local i = Minimap:GetScale()
		 if delta > 0 and i < 4 then
			Minimap:SetScale(i+0.1)
		 elseif delta < 0 and i > 0.5 then
			Minimap:SetScale(i-0.1)
		 end
	  else
		 -------Zoom
		 if delta > 0 then Minimap_ZoomIn() else Minimap_ZoomOut() end
	  end
	end
	Minimap:SetScript('OnMouseWheel', OnMouseWheel)


	-------Drop Down Menu
	local function OnMouseUp(self, button)
	  if button == 'RightButton' then 
		 if IsAltKeyDown() then
			if WatchFrame:IsVisible() then
			   WatchFrame:Hide()
			else
			   WatchFrame:Show()
			end
			
		 else
			ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, 0, 0)
		 end
		 
	  elseif button == 'MiddleButton' then ToggleCalendar()
	  else Minimap_OnClick(self)
	  end
	end
	Minimap:SetScript('OnMouseUp', OnMouseUp)

end

StyleMap()

tMinimap = {
	  Garrison = {GarrisonLandingPageMinimapButton:GetPoint()}
   } 


local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_LOGIN")
c:SetScript('OnEvent',
	function()
local frame = GarrisonLandingPageMinimapButton

frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", 
function()
tMinimap.Garrison = {frame:GetPoint()}
frame:StopMovingOrSizing()
end
)
if tMinimap.Garrison[2] == nil then

end
frame:ClearAllPoints()
frame:SetPoint("TOPLEFT",UIParent,"TOPLEFT",tMinimap.Garrison[4],tMinimap.Garrison[5])
frame:SetScale(0.8)
	end
		)

local function ObjTraker() 
local frame = ObjectiveTrackerFrame
frame:SetPoint("TOP",Minimap,"BOTTOM")
end
hooksecurefunc("ObjectiveTracker_Update", ObjTraker)