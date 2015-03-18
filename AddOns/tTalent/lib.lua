local addon, ns = ...

local Animation = function (self, start, finish)
	local Tx, F = Tx or 0, F or CreateFrame("frame")

	local animation=
		function() 
			local t = GetTime() 
			if (t - Tx > 0.016 ) and (start > finish) then
				start = start - 0.05
				self.model:SetScale(start)
				Tx = t 
			end
		end 
	F:SetScript("OnUpdate",animation) 
end


local SetModel = function (self, s, mymodel)
	self.model:RegisterEvent("PLAYER_LOGIN")

	if s then
		self.model:SetScript('OnEvent',
			function()
				self.model:SetUnit(mymodel)
				self:tAnimation(1.2, 1)
			end)
		self.model:SetScript('OnShow',
			function()
				self.model:SetUnit(mymodel)
				self:tAnimation(1.2, 1)
			end)
	else
		
		self.model:SetScript('OnEvent',
			function()
				self.model:SetModel(mymodel)
			end)
		self.model:SetScript('OnShow',
			function()
				self.model:SetModel(mymodel)
			end)
	end
end

local Show = function (self, point, parent, pointp, pox, poy, strata, Width, Height, px, py, pz, facing)
self.model:SetPoint(point, parent, pointp, pox, poy)
self.model:SetFrameStrata(strata)

self.model:SetPosition(pz, px, py)
self.model:SetFacing(facing)

self.model:SetHeight(Height)
self.model:SetWidth(Width)

self.model:Hide()
self.model:Show()
end

local function TalentBackGround()
	local f = CreateFrame("Frame","tTalentBackGround",PlayerTalentFrame)
	f:SetFrameStrata("LOW")
	f:SetFrameLevel(0)
	f:SetAllPoints(UIParent)
	f:SetParent(PlayerTalentFrame)



	local t = f:CreateTexture(nil,"BACKGROUND")
	t:SetTexture("Interface\\AddOns\\tTalent\\splattalents3")
	t:SetAllPoints(f)
	f.texture = t
	f:SetPoint("Center")
	f:Show()
end
ns.TalentBackGround = TalentBackGround

local function Buttons()

end
ns.Buttons = Buttons
local tCreateModel = function()
	local model = {
		model = CreateFrame("PlayerModel", nil, PlayerTalentFrame),
		tAnimation = Animation,
		tSetModel = SetModel ,
		tShow = Show,
	}

	return model
end



ns.tCreateModel = tCreateModel
