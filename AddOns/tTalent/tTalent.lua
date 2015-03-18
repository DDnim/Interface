local addon, ns = ...
local spectable = ns.spectable
local mySetModel = ns.mySetModel
local myModel = ns.myModel
local myAnimation = ns.myAnimation
local specid = ns.specid
local slider = ns.slider
local modeltable = ns.modeltable
local modeltable = ns.modeltable
tTalent_DB = {
	f1 = 1,
	f2 = 2,
	f3 = 3,
	f4 = 4,
	f5 = 5,

	p1 = 101,
	p2 = 102,
	
	Playercooder = 2,
}
	
local function init()

--************main****************
ns.TalentBackGround()


-- local tPlayer = CreateFrame( "PlayerModel", nil, PlayerTalentFrame);
-- local tPet = CreateFrame( "PlayerModel", nil, PlayerTalentFrame);

-- local f3 = CreateFrame("PlayerModel", nil, PlayerTalentFrame);
-- local f4 = CreateFrame("PlayerModel", nil, PlayerTalentFrame);

-- mySetModel(tPlayer, true, "player")
-- mySetModel(tPet, true, "pet")
-- myModel(tPlayer,"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0, 0, -0.4,-2)
-- myModel(tPet,"CENTER","PlayerTalentFrame","CENTER",-550,-366, "DIALOG", 960, 1080, 0, 0, 0, 3)


-- mySetModel(f3, false, "SPELLS/AmplifyMagic_Impact_Base.m2")
-- mySetModel(f4, false, "SPELLS/Ice_Precast_Uber_Base.m2")
-- myModel(f3,"CENTER","PlayerTalentFrame","CENTER",-629,-550, "DIALOG", 856, 1356, 0, 0, 0, 0)
-- myModel(f4,"CENTER","PlayerTalentFrame","CENTER",-629,-400, "HIGH", 856, 1356, 0, 0, 0, 0)



-- --[[local _, raceEn = UnitRace("player")
-- local s = UnitSex("player")

-- if UnitRace("player") == "Worgen" and tonumber(s) == 3 then
	-- myModel(tPlayer,"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, -0.2, 0, -0.4,-2)
-- end
-- ]]--

--**************Player_Model*************
	local tplayer = ns.tCreateModel(PlayerTalentFrame)
	local tpet = ns.tCreateModel(PlayerTalentFrame)

	tplayer:tSetModel(true, "player")
	tpet:tSetModel(true, "pet")
	
	local race = select(2,UnitRace("player")) or "Troll"
	local xtable = {}
	xtable["Human"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0, 0, -0.4,-2}
	xtable["Dwarf"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0, 0.2, -0.4,-1.5}
	xtable["Draenei"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0.2, 0.2, -0.4,-1.5}
	xtable["Gnome"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0, 0, -1.2,-2}
	xtable["Worgen"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0, 0.1, -0.4,-2}
	xtable["NightElf"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0.1, 0.1, -0.4,-2}
	

	xtable["Orc"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0.2, 0.1, -1,-2}
	xtable["Tauren"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0.2, 0.2, -0.4,-2}
	xtable["Troll"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0.2, 0, -1.2,-2}
	xtable["Scourge"] = xtable["Human"]
	xtable["BloodElf"] = xtable["NightElf"]
	xtable["Goblin"] = xtable["Gnome"]
	
	xtable["Pandaren"] = {"CENTER","PlayerTalentFrame","CENTER",580,-339, "DIALOG", 1338, 1800, 0, 0.2, -0.4,-2}
	
	tplayer:tShow(unpack(xtable[race]))
	tpet:tShow("CENTER","PlayerTalentFrame","CENTER",-550,-366, "DIALOG", 960, 1080, 0, 0, 0, 3)

	
--**************3D Design****************

	local f1 = ns.tCreateModel()
	local f2 = ns.tCreateModel()
	local f3 = ns.tCreateModel()
	local f4 = ns.tCreateModel()
	local f5 = ns.tCreateModel()

	local p1 = ns.tCreateModel()
	local p2 = ns.tCreateModel()

	ns.f1 = f1
	ns.f2 = f2
	ns.f3 = f3
	ns.f4 = f4
	ns.f5 = f5
	ns.p1 = p1
	ns.p2 = p2
	
	local function tDesign() 
		if tTalent_DB.f1 then
			modeltable[tTalent_DB.f1](f1)
			modeltable[tTalent_DB.f2](f2)
			modeltable[tTalent_DB.f3](f3)
			modeltable[tTalent_DB.f4](f4)
			modeltable[tTalent_DB.f5](f5)
			
			modeltable[tTalent_DB.p1](p1)
			modeltable[tTalent_DB.p2](p2)
		end
	end
	tDesign()
	
	local c = CreateFrame( "frame", nil,UIParent);
	c:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	c:SetScript('OnEvent',
	function()
		tDesign()
	end	    
	)



--************plugin**************
--ns.Buttons()

end

local function control()
	local panel = CreateFrame("frame", nil,PlayerTalentFrame)
	panel:SetPoint("LEFT",UIParent,"LEFT")
	panel:SetWidth(200)
	panel:SetHeight(200)
	panel:Hide()
	ns.config(panel)
	ns.panel = panel
end

local function toggleconfig()
      if ns.panel:IsVisible() then
         ns.panel:Hide()
      else
         ns.panel:Show()
      end
end

SLASH_TTALENT1 = "/tta"
SlashCmdList["TTALENT"] = function(txt)
	toggleconfig()
end
   
local function ControlButton()

local f = CreateFrame("Frame",nil,PlayerTalentFrame)
f:SetFrameStrata("HIGH")

f:SetAllPoints(PlayerTalentFramePortrait)
f:SetParent(PlayerTalentFrame)
f:SetScript("OnMouseDown",toggleconfig)

end


local function hide()
for i=1,21 do
   select(i,PlayerTalentFrame:GetRegions()):SetAlpha(0)
end
select(3,PlayerTalentFrame:GetRegions()):SetAlpha(1)

PlayerTalentFrameSpecializationTutorialButton:SetAlpha(0)
PlayerTalentFrameTalentsTutorialButton:SetAlpha(0)
PlayerTalentFrameSpecializationLearnButton:SetAlpha(1)
-----inset
for i = 1, 9 do
   select(i,PlayerTalentFrameInset:GetRegions()):Hide()
end




-----specs
for i = 1,6 do
   select(i,PlayerTalentFrameSpecialization:GetRegions()):Hide()
end

select(7, PlayerTalentFrameSpecialization:GetChildren()):DisableDrawLayer("OVERLAY")
for i = 1, 5 do
   select(i, PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions()):Hide()
end


-----talents


for i = 1, 7 do
   select(i,PlayerTalentFrameTalents:GetRegions()):Hide()
end


for j = 1,7 do
   for i=1,6 do
      select(i,_G["PlayerTalentFrameTalentsTalentRow"..j]:GetRegions()):Hide()
   end
end


-----glyphs


-----group

select(1,PlayerSpecTab1:GetRegions()):SetAlpha(0)
select(1,PlayerSpecTab2:GetRegions()):SetAlpha(0)

end
local function tabs()
TabScale =2
PlayerTalentFrameTab1:SetScale(TabScale)
PlayerTalentFrameTab2:SetScale(TabScale)
PlayerTalentFrameTab3:SetScale(TabScale)

local z=0
PlayerTalentFrameTab1LeftDisabled:SetAlpha(z)
PlayerTalentFrameTab1MiddleDisabled:SetAlpha(z)
PlayerTalentFrameTab1RightDisabled:SetAlpha(z)
PlayerTalentFrameTab1Left:SetAlpha(z)
PlayerTalentFrameTab1Middle:SetAlpha(z)
PlayerTalentFrameTab1Right:SetAlpha(z)
PlayerTalentFrameTab1HighlightTexture:SetAlpha(z)

PlayerTalentFrameTab2LeftDisabled:SetAlpha(z)
PlayerTalentFrameTab2MiddleDisabled:SetAlpha(z)
PlayerTalentFrameTab2RightDisabled:SetAlpha(z)
PlayerTalentFrameTab2Left:SetAlpha(z)
PlayerTalentFrameTab2Middle:SetAlpha(z)
PlayerTalentFrameTab2Right:SetAlpha(z)
PlayerTalentFrameTab2HighlightTexture:SetAlpha(z)

PlayerTalentFrameTab3LeftDisabled:SetAlpha(z)
PlayerTalentFrameTab3MiddleDisabled:SetAlpha(z)
PlayerTalentFrameTab3RightDisabled:SetAlpha(z)
PlayerTalentFrameTab3Left:SetAlpha(z)
PlayerTalentFrameTab3Middle:SetAlpha(z)
PlayerTalentFrameTab3Right:SetAlpha(z)
PlayerTalentFrameTab3HighlightTexture:SetAlpha(z)


PlayerTalentFrameTab1Text:SetFont("Interface\\AddOns\\tTalent\\edo.TTF",12)
PlayerTalentFrameTab1Text:SetText("SPECS")
PlayerTalentFrameTab2Text:SetFont("Interface\\AddOns\\tTalent\\edo.TTF",12)
PlayerTalentFrameTab2Text:SetText("TALENTS")
PlayerTalentFrameTab3Text:SetFont("Interface\\AddOns\\tTalent\\edo.TTF",12)
PlayerTalentFrameTab3Text:SetText("GLYPHS")

PlayerTalentFrameTab2:ClearAllPoints()
PlayerTalentFrameTab2:SetPoint("CENTER",PlayerTalentFrame,"TOP")

PlayerTalentFrameTab1:ClearAllPoints()
PlayerTalentFrameTab1:SetPoint("RIGHT",PlayerTalentFrameTab2,"LEFT")

PlayerTalentFrameTab3:ClearAllPoints()
PlayerTalentFrameTab3:SetPoint("LEFT",PlayerTalentFrameTab2,"RIGHT")



end



local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_LOGIN")
c:SetScript('OnEvent',
	function()
		if not IsAddOnLoaded("Blizzard_TalentUI") then
			LoadAddOn("Blizzard_TalentUI")
		end
		init()

		PlayerTalentFrame:ClearAllPoints()
		PlayerTalentFrame:SetPoint("Center", 0, 0)
		PlayerTalentFrame.SetPoint = function() end

		hooksecurefunc("PlayerTalentFrame_UpdateTabs",tabs)
		ControlButton()
		hide()
		control()
	end
		)