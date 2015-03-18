function tAurasBoss_Onload(self)
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")

	self:SetMinResize(80, 80)
	self:SetFrameStrata("HIGH")
	self:SetFrameLevel(4)
end

function tAurasBossBuff(frame,unit,filter)
   for i=1,8 do
		local buff =_G["tAruas"..unit..filter..i] or CreateFrame("Frame", "tAruas"..unit..filter..i,frame,"tAuraFrameTemplate");
		local BUTTON_SIZE = buff:GetWidth()
		buff.id = i
		buff.filter = filter
		buff.unit = unit
		buff:SetID()
		buff:SetPoint("TOPRIGHT",-BUTTON_SIZE*((i-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((i-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	end
end

function tAurasBossDebuff(frame,unit,filter)
   for i=1,16 do
		local buff =_G["tAruas"..unit..filter..i] or CreateFrame("Frame", "tAruas"..unit..filter..i,frame,"tAuraFrameTemplate");
		local BUTTON_SIZE = 48

		buff.id = i
		buff.filter = filter
		buff.unit = unit
		buff:SetID()
		buff:SetSize(BUTTON_SIZE,BUTTON_SIZE)
		buff:SetPoint("BOTTOMLEFT",BUTTON_SIZE*((i-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),BUTTON_SIZE*math.floor((i-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	end
end