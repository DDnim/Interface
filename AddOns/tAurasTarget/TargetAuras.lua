function tAurasOther_Onload(self)
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:SetMinResize(80, 80)
	self:SetFrameStrata("HIGH")
	self:SetFrameLevel(4)
end

function tAurasTargetBottom(frame,unit,filter)
   for i=1,16 do
		local buff =_G["tAruas"..unit..'Bottom'..i] or CreateFrame("Frame", "tAruas"..unit..'Bottom'..i,frame,"tAuraFrameTemplate");
		local BUTTON_SIZE = buff:GetWidth()
		buff.id = i
		buff.filter = filter
		buff.unit = unit
		buff:SetID()
		buff:ClearAllPoints()
		buff:SetPoint("TOPRIGHT",-BUTTON_SIZE*((i-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((i-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	end
end

function tAurasTargetTop(frame,unit,filter)
   for i=1,16 do
		local buff =_G["tAruas"..unit..'Top'..i] or CreateFrame("Frame", "tAruas"..unit..'Top'..i,frame,"tAuraFrameTemplate");
		local BUTTON_SIZE = 48

		buff.id = i
		buff.filter = filter
		buff.unit = unit
		buff:SetID()
		buff:SetSize(BUTTON_SIZE,BUTTON_SIZE)
		buff:SetPoint("BOTTOMLEFT",BUTTON_SIZE*((i-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),BUTTON_SIZE*math.floor((i-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	end
end