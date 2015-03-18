LoadAddOn("Blizzard_TalentUI")
local f = CreateFrame( "PlayerModel", nil, PlayerTalentFrame);
local f2 = CreateFrame("PlayerModel", nil, PlayerTalentFrame);
local f3 = CreateFrame("PlayerModel", nil, PlayerTalentFrame);

local function myTalentBackGround()
   local f = CreateFrame("Frame",nil,PlayerTalentFrame)
   f:SetFrameStrata("BACKGROUND")
   f:SetWidth(1960) -- Set these to whatever height/width is needed 
   f:SetHeight(1080) -- for your Texture
   
   local t = f:CreateTexture(nil,"BACKGROUND")
 
   t:SetTexture("Interface\\AddOns\\Tushu\\tTalent\\splattalents3")
   t:SetAllPoints(f)
   f.texture = t
   f:SetPoint("CENTER")
   f:Show()


end
myTalentBackGround()

local function mySetModel(self, s, model)
	self:RegisterEvent("PLAYER_LOGIN")
	if s then
	self:SetScript('OnEvent',
		function()
			self:SetUnit(model)
		end)
	self:SetScript('OnShow',
		function()
			self:SetUnit(model)
		end)
	else
	
	self:SetScript('OnEvent',
		function()
			self:SetModel(model)
		end)
	self:SetScript('OnShow',
		function()
			self:SetModel(model)
		end)
	end
end

local function myModel(self)
self:SetParent("PlayerTalentFrame")
self:SetPoint("CENTER",600,-200)
self:SetHeight(4000)
self:SetWidth(800)
self:SetPosition(-5, 0, 0.1)
self:SetFacing(-2)
end

mySetModel(f, true, "player")
mySetModel(f2, false, "SPELLS/Priest_PowerInfusion.m2")
mySetModel(f3, false, "SPELLS/Arcane_Form_Precast.m2")
myModel(f)
myModel(f2)
myModel(f3)


--PlayerTalentFrame:SetPoint("TOPLEFT",635, -395)
--PlayerTalentFrame.SetPoint = function() end